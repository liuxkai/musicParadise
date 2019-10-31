package com.train.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.train.dao.SongDao;
import com.train.entity.Song;
import com.train.util.DataSourceUtil;

public class SongDaoImpl implements SongDao {

	@Override
	public int insert(Song song, Long sid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "insert into song(`song_name`, `url`, `VV`, `Tid`, `Sid`, `upload_date`) value(?, ?, ?, ?, ?, ?)";
		System.out.println(song.getTypeName());
		int result = qr.update(sql, song.getSongName(), song.getUrl(), 0, song.getTypeName(), sid, sdf.format(song.getUploadDate()));
		return result;
	}

	@Override
	public Song findOne(Song song) throws SQLException {
		//System.out.println("数据库SongDaoImpl层43行"+song);
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("SELECT a.song_id, a.song_name, b.singer_name, c.type_name, a.VV, a.url, a.lrc_url, a.Rid FROM `song` AS a, `singer` AS b, `type` AS c WHERE a.Sid = b.Sid AND a.Tid = c.Tid");
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Object> args = new ArrayList<>();
		//此处不可根据lrcurl查询，因为再查询songName时后才有lrcurl
		if(song.getSongName() != null && !song.getSongName().equals("")) {
			sql.append(" and a.song_name = ?");
			args.add(song.getSongName());
		}
		if(song.getSongId() != null) {
			sql.append(" and a.song_id = ?");
			args.add(song.getSongId());
		}
		Song result = qr.query(sql.toString(), new BeanHandler<>(Song.class, new BasicRowProcessor(new GenerousBeanProcessor())), args.toArray());
		//System.out.println("数据库SongDaoImpl层52行"+result);
		return result;
	}

	@Override
	public int updataById(Song song, Long songId) throws SQLException {
		//System.out.println("数据库SongDaoImpl层58行"+song+"songId"+songId);
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update song set `lrc_url`=? where song_id=?";
		int result = qr.update(sql, song.getLrcUrl(), songId);
		//System.out.println("数据库SongDaoImpl层62行"+result);
		return result;
	}

	@Override
	public int updataBySongName(Song song) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update song set `VV`=(`VV` + 1) where song_name=?";
		int result = qr.update(sql, song.getSongName());
		return result;
	}
	
	@Override
	public List<Song> findAll() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("SELECT a.song_id, a.song_name, b.singer_name, c.type_name, a.VV, a.url, a.lrc_url, a.upload_date FROM `song` AS a, `singer` AS b, `type` AS c WHERE a.Sid = b.Sid AND a.Tid = c.Tid");
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Song> result = qr.query(sql.toString(), new BeanListHandler<>(Song.class, new BasicRowProcessor(new GenerousBeanProcessor())));
		//System.out.println("数据库SongDaoImpl   27行"+result);
		return result;
	}
	
	@Override
	public Long findCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT COUNT(1) FROM song";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public List<Song> findPage(int limit, int startIndex) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT * FROM (SELECT a.song_id, a.song_name, b.singer_name, c.type_name, a.VV, a.url, a.lrc_url, a.upload_date FROM `song` AS a, `singer` AS b, `type` AS c WHERE a.Sid = b.Sid AND a.Tid = c.Tid) AS a limit ?,?";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Song> result = qr.query(sql, new BeanListHandler<>(Song.class, new BasicRowProcessor(new GenerousBeanProcessor())), startIndex, limit);
		return result;
	}

	@Override
	public int updataRidBySongName(Song song) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update song set `Rid`=? where song_id=?";
		int result = qr.update(sql, song.getRid(), song.getSongId());
		return result;
	}

	@Override
	public Long selectJdgqSongVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT count(1) FROM song WHERE Tid = 1";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public Long selectLxgqSongVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT count(1) FROM song WHERE Tid = 4";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public Long selectTggqSongVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT count(1) FROM song WHERE Tid = 2";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public Long selectTyqSongVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT count(1) FROM song WHERE Tid = 3";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public Long selectZxgqSongVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT count(1) FROM (SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url, b.upload_date, album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, a.upload_date, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url, upload_date FROM song) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid) AS c ORDER BY upload_date desc LIMIT 10";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	


}
