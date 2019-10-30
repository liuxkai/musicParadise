package com.train.dao;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.Album;

public interface AlbumDao {

	List<Album> findAll() throws SQLException;

	Album findOne(Album album) throws SQLException;

	int updata(Album album) throws SQLException;

	int insert(Album album, Long sid) throws SQLException;

	Long findCount() throws SQLException;

	List<Album> findPage(int limit, int startIndex) throws SQLException;

}
