package com.train.dao;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.Song;

public interface SongDao {

	List<Song> findAll() throws SQLException;

	int insert(Song song, Long long1) throws SQLException;

	Song findOne(Song song) throws SQLException;

	int updataById(Song song, Long songId) throws SQLException;

	int updataBySongName(Song song) throws SQLException;

	Long findCount() throws SQLException;

	List<Song> findPage(int limit, int startIndex) throws SQLException;

	int updataRidBySongName(Song song) throws SQLException;


}
