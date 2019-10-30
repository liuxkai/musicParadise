package com.train.service.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.train.dao.UserDao;
import com.train.dao.impl.UserDaoImpl;
import com.train.entity.User;
import com.train.service.UserService;

public class UserServiceImpl implements UserService{

	@Override
	public boolean activeUser(String code) throws SQLException {
		UserDao userDao = new UserDaoImpl();
		User result = userDao.findOne(User.builder().code(code).build());
		if(result != null) {
			result.setLastLoginTime(new Date(0, 0, 0, 0, 0, 0));//激活时间都设为0
			result.setState((byte)1); //数据库中存在code,说明用此用户，可以激活并改变状态码
			userDao.update(result);
			return true;   
		}
		return false;
	}

	@Override
	public User getOne(User user) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		return userDaoImpl.findOne(user);
		
	}

	@Override
	public void update(User result) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		userDaoImpl.update(result);
	}

	@Override
	public int add(User build) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		return userDaoImpl.insert(build);
	}


	@Override
	public List<User> getSome(User user) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		return userDaoImpl.findAll(user);
	}

	@Override
	public Long getCount() throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		return userDaoImpl.findCount();
	}

	@Override
	public List<User> getAll(User user) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		User userAdmin = userDaoImpl.findOne(user);
		List<User> result = null;
		if(!"ADMIN".equals(userAdmin.getRole().name())) {//先判断此用户是不是管理员，是管理员才去根据条件查询数据（将放一个空user）
			return null;
		}else {
			result = userDaoImpl.findAll(new User());
		}
		return result;
	}
	
	@Override
	public List<User> getPage(User user, int limit, int startIndex) throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		User userAdmin = userDaoImpl.findOne(user);
		List<User> result = null;
		if(!"ADMIN".equals(userAdmin.getRole().name())) {//先判断此用户是不是管理员，是管理员才去根据条件查询数据（将放一个空user）
			return null;
		}else {
			result = userDaoImpl.findPage(new User(), limit, startIndex);
		}
		return result;
	}

	@Override
	//获取用户的总人数和男性人数，计算出男性占人数的百分比并返回 
	public int getUserMaleFemaleRatio() throws SQLException {
		UserDao userDaoImpl = new UserDaoImpl();
		Long userCount = userDaoImpl.findCount();
		Long isManCount = userDaoImpl.findSexIsManCount();
		Double manRatio = (double) (isManCount*100/userCount);//计算出男性人数占总人数的百分之多少
		return (int)Math.round(manRatio);
	}



}
