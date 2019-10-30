package com.train.service;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.Singer;

public interface SingerService {

	Singer add(Singer singer) throws SQLException;

	List<Singer> getAll() throws SQLException;

	Singer getOne(Singer singer) throws SQLException;

	int updata(Singer singer) throws SQLException;

	int addPhoto(Singer singer) throws SQLException;

	Long getCount() throws SQLException;

	List<Singer> getPage(int limit, int startIndex) throws SQLException;

	int getSingerMaleFemaleRatio() throws SQLException;

}
