package com.train.dao;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.Singer;

public interface SingerDao {

	int insert(Singer singer) throws SQLException;

	Singer findOne(Singer singer) throws SQLException;

	List<Singer> findAll() throws SQLException;

	int updata(Singer singer) throws SQLException;

	int updataById(Singer singer, Long sid) throws SQLException;

	Long findCount() throws SQLException;

	List<Singer> findPage(int limit, int startIndex) throws SQLException;

	Long findSexIsManCount() throws SQLException;


}
