package com.train.service;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.Album;

public interface AlbumService {

	List<Album> getAll() throws SQLException;

	Album getOne(Album build) throws SQLException;

	int updata(Album album) throws SQLException;

	int add(Album album) throws SQLException;

	Long getCount() throws SQLException;

	List<Album> getPage(int limit, int startIndex) throws SQLException;

}
