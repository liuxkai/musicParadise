package com.train.dao;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.User;

public interface UserDao {
	// 获取所有用户信息
	public List<User> findAll(User user) throws SQLException;

	// 保存用户数据
	public int insert(User user) throws SQLException;

	// 多条件查询一条数据
	public User findOne(User user) throws SQLException ;
	
	// 根据id删除用户
	public int deleteById(Long id) throws SQLException;
	
	// 修改用户信息
	public int update(User user) throws SQLException ;

	public Long findCount() throws SQLException;

	public List<User> findPage(User user, int limit, int startIndex) throws SQLException;

	public Long findSexIsManCount() throws SQLException;

	public Long findActiveUser() throws SQLException;

}
