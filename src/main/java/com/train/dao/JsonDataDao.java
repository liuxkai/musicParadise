package com.train.dao;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.JsonData;
import com.train.entity.Song;

public interface JsonDataDao {

	List<JsonData> selectList(int tid) throws SQLException;

	List<JsonData> selectNewList(int quantity) throws SQLException;

	List<JsonData> selectListBySearch(String keyword) throws SQLException;

	List<Song> selectMusicByVV() throws SQLException;

	List<JsonData> selectMusicOneBySongName(String songName) throws SQLException;

	List<JsonData> selectMusicListByRid(Long rid) throws SQLException;

}
