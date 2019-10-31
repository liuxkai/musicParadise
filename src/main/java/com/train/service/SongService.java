package com.train.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.train.entity.Song;

public interface SongService {

	List<Song> getAll() throws SQLException;

	int add(Song song, Long long1) throws SQLException;

	int addLrc(Song song) throws SQLException;

	int updataVVBySongName(Song build) throws SQLException;

	Long getCount() throws SQLException;

	List<Song> getPage(int limit, int startIndex) throws SQLException;

	Song getOne(Song build) throws SQLException;

	int updataBySongId(Song song) throws SQLException;

	Map<String, Long> getTypeSongVV() throws SQLException;


}
