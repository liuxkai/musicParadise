package com.train.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.train.dao.SongDao;
import com.train.dao.impl.SongDaoImpl;
import com.train.entity.Song;
import com.train.service.SongService;

public class SongServiceImpl implements SongService{

	@Override
	public int add(Song song, Long long1) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.insert(song, long1);
	}

	@Override
	public int addLrc(Song song) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		Song resultSong = songDaoImpl.findOne(song);
		if(resultSong != null) {
			int result = songDaoImpl.updataById(song, resultSong.getSongId());//song中用lrcurl，resultSong里有SongId
			
			return result;
		}
		return 0;
	}

	@Override
	public int updataVVBySongName(Song song) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.updataBySongName(song);
	}

	@Override
	public Long getCount() throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.findCount();
	}

	@Override
	public List<Song> getAll() throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.findAll();
	}
	
	@Override
	public List<Song> getPage(int limit, int startIndex) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.findPage(limit, startIndex);
	}

	@Override
	public Song getOne(Song song) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.findOne(song);
	}

	@Override
	public int updataBySongId(Song song) throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		return songDaoImpl.updataRidBySongName(song);
	}

	@Override
	public Map<String, Long> getTypeSongVV() throws SQLException {
		SongDao songDaoImpl = new SongDaoImpl();
		Map<String, Long> hashMap = new HashMap<>();
		Long jdgq = songDaoImpl.selectJdgqSongVV();//获取经典歌曲点击量
		Long lxgq = songDaoImpl.selectLxgqSongVV();//获取流行歌曲点击量
		Long yggq = songDaoImpl.selectTggqSongVV();//获取摇滚歌曲点击量
		Long tygq = songDaoImpl.selectTyqSongVV();//获取童谣歌曲点击量
		Long zxgq = songDaoImpl.selectZxgqSongVV();//获取最新歌曲点击量
		hashMap.put("jdgq", jdgq);
		hashMap.put("lxgq", lxgq);
		hashMap.put("yggq", yggq);
		hashMap.put("tygq", tygq);
		hashMap.put("zxgq", zxgq);
		return hashMap;
	}


}
