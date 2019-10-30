package com.train.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.train.dao.JsonDataDao;
import com.train.dao.impl.JsonDataDaoImpl;
import com.train.entity.JsonData;
import com.train.entity.Song;
import com.train.service.JsonDataService;

public class JsonDataServiceImpl implements JsonDataService {

	@Override
	public List<JsonData> findMusicTypeList(int tid) throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectList(tid);
	}

	@Override
	public List<JsonData> findNewMusicTypeList(int quantity) throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectNewList(quantity);
	}

	@Override
	public List<JsonData> findMusicListBySearchMusic(String keyword) throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectListBySearch(keyword);
	}

	@Override
	public List<Song> findMusicByRankingMusic() throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectMusicByVV();
	}

	@Override
	public List<JsonData> findMusicOneBySongName(String songName) throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectMusicOneBySongName(songName);
	}

	@Override
	public List<JsonData> findMusicListByRid(Long rid) throws SQLException {
		JsonDataDao jsonDataDao = new JsonDataDaoImpl();
		return jsonDataDao.selectMusicListByRid(rid);
	}

}
