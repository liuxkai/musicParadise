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

import com.train.dao.UserDao;
import com.train.entity.User;
import com.train.util.DataSourceUtil;

public class UserDaoImpl implements UserDao{
	@Override
	public Long findCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select COUNT(1) from user";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}
	
	@Override
	public List<User> findAll(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("select * from user where 1=1");
		List<Object> paramsList = new ArrayList<>();

		if (user.getName() != null && !user.getName().trim().equals("")) {
			sql.append(" and name = ?");
			paramsList.add(user.getName());
		}
		if (user.getSex() != null) {
			sql.append(" and sex = ?");
			paramsList.add(user.getSex());
		}
		if (user.getAge() != null) {
			sql.append(" and age = ?");
			paramsList.add(user.getAge());
		}
		if (user.getUserName() != null && !user.getUserName().trim().equals("")) {
			sql.append(" and username = ?");
			paramsList.add(user.getUserName());
		}
		if (user.getPassWord() != null && !user.getPassWord().trim().equals("")) {
			sql.append(" and password = ?");
			paramsList.add(user.getPassWord());
		}
		if (user.getRole() != null) {
			sql.append(" and role = ?");
			paramsList.add(user.getRole().name());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (user.getLastLoginTime() != null) {
			sql.append(" and last_login_time = ?");
			paramsList.add(sdf.format(user.getLastLoginTime()));
		}
		if (user.getVip() != null) {
			sql.append(" and vip = ?");
			paramsList.add(user.getVip().name());
		}
		if (user.getEMail() != null && !user.getEMail().trim().equals("")) {
			sql.append(" and e_mail = ?");
			paramsList.add(user.getEMail());
		}
		if (user.getState() != null) {
			sql.append(" and state = ?");
			paramsList.add(user.getState());
		}
		if (user.getCode() != null && !user.getCode().trim().equals("")) {
			sql.append(" and code = ?");
			paramsList.add(user.getCode());
		}
		Object[] params = paramsList.toArray();
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<User> result = qr.query(sql.toString(), new BeanListHandler<>(User.class, new BasicRowProcessor(new GenerousBeanProcessor())), params);

		return result;
	}

	@Override
	public int insert(User user) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());

		String sql = "insert into user(`name`, `sex`, `age`, `username`, `password`, `e_mail`,`state`, `code`, `role`) value(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		int result  = qr.update(sql, user.getName(), user.getSex(), user.getAge(), user.getUserName(),user.getPassWord(),user.getEMail(), user.getState(), user.getCode(), user.getRole().name());
		return result;
	}

	@Override
	public User findOne(User user) throws SQLException {

		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());

		StringBuffer sql = new StringBuffer("select * from user where 1=1");

		List<Object> paramsList = new ArrayList<>();

		if (user.getName() != null && !user.getName().equals("")) {
			sql.append(" and name = ?");
			paramsList.add(user.getName());
		}
		if (user.getSex() != null) {
			sql.append(" and sex = ?");
			paramsList.add(user.getSex());
		}
		if (user.getAge() != null) {
			sql.append(" and age = ?");
			paramsList.add(user.getAge());
		}
		if (user.getUserName() != null && !user.getUserName().trim().equals("")) {
			sql.append(" and username = ?");
			paramsList.add(user.getUserName());
		}
		if (user.getPassWord() != null && !user.getPassWord().trim().equals("")) {
			sql.append(" and password = ?");
			paramsList.add(user.getPassWord());
		}
		if (user.getRole() != null) {
			sql.append(" and role = ?");
			paramsList.add(user.getRole().name());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (user.getLastLoginTime() != null) {
			sql.append(" and last_login_time = ?");
			paramsList.add(sdf.format(user.getLastLoginTime()));
		}
		if (user.getVip() != null) {
			sql.append(" and vip = ?");
			paramsList.add(user.getVip().name());
		}
		if (user.getEMail() != null && !user.getEMail().trim().equals("")) {
			sql.append(" and e_mail = ?");
			paramsList.add(user.getEMail());
		}
		if (user.getState() != null) {
			sql.append(" and state = ?");
			paramsList.add(user.getState());
		}
		if (user.getCode() != null && !user.getCode().trim().equals("")) {
			sql.append(" and code = ?");
			paramsList.add(user.getCode());
		}

		Object[] params = paramsList.toArray();
		User result = qr.query(sql.toString(), new BeanHandler<>(User.class, new BasicRowProcessor(new GenerousBeanProcessor())), params);
		return result;
	}

	@Override
	public int deleteById(Long id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "delete from user where id = ?";
		int result = qr.update(sql, id);
		return result;
	}
	
	@Override
	public int update(User user) throws SQLException {
		// 2019-10-10 09:06:35
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update `user` set `name` = ?, `age` = ?, `sex` = ?, `username` = ?, `password` = ?, `last_login_time` = ?, `state` = ? where id = ?";
		int result =  qr.update(sql, user.getName(), user.getAge(), user.getSex(), user.getUserName(), user.getPassWord(), sdf.format(user.getLastLoginTime()), user.getState(), user.getId());
		return result;
	}

	@Override
	public List<User> findPage(User user, int limit, int startIndex) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		StringBuffer sql = new StringBuffer("select * from user where 1=1");
		List<Object> paramsList = new ArrayList<>();

		if (user.getName() != null && !user.getName().trim().equals("")) {
			sql.append(" and name = ?");
			paramsList.add(user.getName());
		}
		if (user.getSex() != null) {
			sql.append(" and sex = ?");
			paramsList.add(user.getSex());
		}
		if (user.getAge() != null) {
			sql.append(" and age = ?");
			paramsList.add(user.getAge());
		}
		if (user.getUserName() != null && !user.getUserName().trim().equals("")) {
			sql.append(" and username = ?");
			paramsList.add(user.getUserName());
		}
		if (user.getPassWord() != null && !user.getPassWord().trim().equals("")) {
			sql.append(" and password = ?");
			paramsList.add(user.getPassWord());
		}
		if (user.getRole() != null) {
			sql.append(" and role = ?");
			paramsList.add(user.getRole().name());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (user.getLastLoginTime() != null) {
			sql.append(" and last_login_time = ?");
			paramsList.add(sdf.format(user.getLastLoginTime()));
		}
		if (user.getVip() != null) {
			sql.append(" and vip = ?");
			paramsList.add(user.getVip().name());
		}
		if (user.getEMail() != null && !user.getEMail().trim().equals("")) {
			sql.append(" and e_mail = ?");
			paramsList.add(user.getEMail());
		}
		if (user.getState() != null) {
			sql.append(" and state = ?");
			paramsList.add(user.getState());
		}
		if (user.getCode() != null && !user.getCode().trim().equals("")) {
			sql.append(" and code = ?");
			paramsList.add(user.getCode());
		}
		sql.append(" limit ?,?");
		paramsList.add(startIndex);
		paramsList.add(limit);
		Object[] params = paramsList.toArray();
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<User> result = qr.query(sql.toString(), new BeanListHandler<>(User.class, new BasicRowProcessor(new GenerousBeanProcessor())), params);

		return result;
	}

	@Override
	//查询性别是男性的用户人数
	public Long findSexIsManCount() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select COUNT(1) from user WHERE sex=1";
		Long result = (Long)qr.query(sql, new ScalarHandler<>());
		return result;
	}


}
