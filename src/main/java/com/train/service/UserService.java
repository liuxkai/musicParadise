package com.train.service;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.User;

public interface UserService {
	//激活用户
	public boolean activeUser(String code) throws SQLException;
	
	public User getOne(User user) throws SQLException;

	public void update(User result) throws SQLException;

	public int add(User build) throws SQLException;

	public List<User> getAll(User user) throws SQLException;

	public List<User> getSome(User build) throws SQLException;

	public Long getCount() throws SQLException;

	public List<User> getPage(User onlineUser, int limit, int startIndex) throws SQLException;

	public int getUserMaleFemaleRatio() throws SQLException;

	

}
