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

import com.train.dao.SingerDao;
import com.train.entity.Singer;
import com.train.util.DataSourceUtil;

public class SingerDaoImpl implements SingerDao {


	@Override
	public int insert(Singer singer) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into singer(`singer_name`) value (?)";
		int result = qr.update(sql, singer.getSingerName());
		return result;
	}

	@Override
	public Singer findOne(Singer singer) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("select * from singer where 1=1");
		List<Object> args = new ArrayList<>();
		//不可根据photourl查询
		if(singer.getSingerName() != null && !singer.getSingerName().trim().equals("")) {
			sql.append(" and singer_name = ?");
			args.add(singer.getSingerName());
		}
		if(singer.getSid() != null) {
			sql.append(" and Sid = ?");
			args.add(singer.getSid());
		}
		Singer result = qr.query(sql.toString(), new BeanHandler<>(Singer.class, new BasicRowProcessor(new GenerousBeanProcessor())), args.toArray());
		return result;
	}

	@Override
	public int updata(Singer singer) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update singer set `singer_name`=?,`hobby`=?,`sex`=?,`birthday`=? where Sid=?";
		int result = qr.update(sql, singer.getSingerName(), singer.getHobby(), singer.getSex(), singer.getBirthday(), singer.getSid());
		return result;
	}

	@Override
	public int updataById(Singer singer, Long sid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update singer set `photo_url`=? where Sid =?";
		int result = qr.update(sql, singer.getPhotoUrl(), sid);
		return result;
	}

	@Override
	public List<Singer> findAll() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("SELECT * FROM singer");
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Singer> result = qr.query(sql.toString(), new BeanListHandler<>(Singer.class, new BasicRowProcessor(new GenerousBeanProcessor())));
		return result;
	}
	
	@Override
	public Long findCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT COUNT(1) FROM singer";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

	@Override
	public List<Singer> findPage(int limit, int startIndex) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "SELECT * FROM singer limit ?, ?";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Singer> result = qr.query(sql, new BeanListHandler<>(Singer.class, new BasicRowProcessor(new GenerousBeanProcessor())), startIndex, limit);
		return result;
	}

	@Override
	public Long findSexIsManCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select COUNT(1) from singer WHERE sex=1";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}

}
