package com.train.service.impl;

import java.sql.SQLException;
import java.util.List;

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


}
