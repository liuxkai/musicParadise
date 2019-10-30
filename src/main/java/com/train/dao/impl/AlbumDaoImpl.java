package com.train.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.train.dao.AlbumDao;
import com.train.entity.Album;
import com.train.util.DataSourceUtil;

public class AlbumDaoImpl implements AlbumDao {

	@Override
	public List<Album> findAll() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT a.Aid, a.album_name, a.album_introduce,b.singer_name  FROM singer AS b, album AS a WHERE a.Sid = b.Sid";
		List<Album> result = qr.query(sql, new BeanListHandler<>(Album.class, new BasicRowProcessor(new GenerousBeanProcessor())));
		//System.out.println("AlbumDaoImpl层，第22行--"+result);
		return result;
	}

	@Override
	public Album findOne(Album album) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("SELECT a.Aid, a.album_name, a.album_introduce,b.singer_name  FROM singer AS b, album AS a WHERE a.Sid = b.Sid");
		List<Object> args = new ArrayList<>();
		if(album.getAlbumName() != null && !album.getAlbumName().trim().equals("")) {
			sql.append(" and album_name = ?");
			args.add(album.getAlbumName());
		}
		if(album.getAid() != null) {
			sql.append(" and Aid = ?");
			args.add(album.getAid());
		}
		Album result = qr.query(sql.toString(), new BeanHandler<>(Album.class, new BasicRowProcessor(new GenerousBeanProcessor())), args.toArray());
		return result;
	}

	@Override
	public int updata(Album album) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update album set `album_name`=?,`album_introduce`=? where Aid=?";
		int result = qr.update(sql, album.getAlbumName(), album.getAlbumIntroduce(), album.getAid());
		return result;
	}

	@Override
	public int insert(Album album, Long sid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into album (album_name, Sid, album_introduce) value (?, ?, ?)";
		int result = qr.update(sql, album.getAlbumName(), sid, album.getAlbumIntroduce());
		return result;
	}

	@Override
	public Long findCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT COUNT(1) FROM (SELECT a.Aid, a.album_name, a.album_introduce,b.singer_name  FROM singer AS b, album AS a WHERE a.Sid = b.Sid) AS c";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public List<Album> findPage(int limit, int startIndex) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT * FROM (SELECT a.Aid, a.album_name, a.album_introduce,b.singer_name  FROM singer AS b, album AS a WHERE a.Sid = b.Sid) AS c limit ?,?";
		List<Album> result = qr.query(sql, new BeanListHandler<>(Album.class, new BasicRowProcessor(new GenerousBeanProcessor())), startIndex, limit);
		return result;
	}

}
