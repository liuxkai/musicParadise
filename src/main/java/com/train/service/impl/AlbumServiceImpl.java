package com.train.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.train.dao.AlbumDao;
import com.train.dao.SingerDao;
import com.train.dao.impl.AlbumDaoImpl;
import com.train.dao.impl.SingerDaoImpl;
import com.train.entity.Album;
import com.train.entity.Singer;
import com.train.service.AlbumService;

public class AlbumServiceImpl implements AlbumService{

	@Override
	public List<Album> getAll() throws SQLException {
		AlbumDao albumDao = new AlbumDaoImpl();
		return albumDao.findAll();
	}

	@Override
	public Album getOne(Album album) throws SQLException {
		AlbumDao albumDao = new AlbumDaoImpl();
		return albumDao.findOne(album);
	}

	@Override
	public int updata(Album album) throws SQLException {
		AlbumDao albumDao = new AlbumDaoImpl();
		return albumDao.updata(album);
	}

	@Override
	public int add(Album album) throws SQLException {
		//添加专辑先查询专辑歌手是否存在
		SingerDao singerDaoImpl = new SingerDaoImpl();
		Singer singer = singerDaoImpl.findOne(Singer.builder().singerName(album.getSingerName()).build());
		//如果专辑歌手不存在则返回0，前端显示添加失败
		if(singer == null) {
			return 0;
		//如果不根据歌手查询出singer！=null，则歌手存在，此时向专辑里添加专辑	
		}else {
			AlbumDao albumDaoImpl = new AlbumDaoImpl();
			int result = albumDaoImpl.insert(album,singer.getSid());//将查询出来歌曲sid添加入album表中
			return result;
		}
	}

	@Override
	public Long getCount() throws SQLException {
		AlbumDao albumDao = new AlbumDaoImpl();
		return albumDao.findCount();
	}

	@Override
	public List<Album> getPage(int limit, int startIndex) throws SQLException {
		AlbumDao albumDao = new AlbumDaoImpl();
		return albumDao.findPage(limit, startIndex);
	}

}
