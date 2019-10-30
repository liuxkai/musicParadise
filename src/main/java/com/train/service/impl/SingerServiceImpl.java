package com.train.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.train.dao.SingerDao;
import com.train.dao.impl.SingerDaoImpl;
import com.train.entity.Singer;
import com.train.service.SingerService;

public class SingerServiceImpl implements SingerService {

	@Override
	public Singer add(Singer singer) throws SQLException {
		SingerDao singerDao = new SingerDaoImpl();
		Singer result = singerDao.findOne(singer); //添加歌手之前先查数据库中又没有这个歌手，没有这个歌手在执行添加，添加后获取歌手id
		if(result != null) {
			return result;
		}else {
			singerDao.insert(singer);
			result = singerDao.findOne(singer); 
		}
		return result;
	}

	@Override
	public List<Singer> getAll() throws SQLException {
		SingerDao singerDao = new SingerDaoImpl();
		return singerDao.findAll();
	}

	@Override
	public Singer getOne(Singer singer) throws SQLException {
		SingerDao singerDao = new SingerDaoImpl();
		return singerDao.findOne(singer);
	}

	@Override
	public int updata(Singer singer) throws SQLException {
		SingerDao singerDao = new SingerDaoImpl();
		return singerDao.updata(singer);
	}

	@Override
	public int addPhoto(Singer singer) throws SQLException {
		SingerDao singerDao = new SingerDaoImpl();
		Singer singerResult = singerDao.findOne(singer);
		if(singerResult != null) {
			int result = singerDao.updataById(singer, singerResult.getSid());
			return result;
		}
		return 0;
	}

	@Override
	public Long getCount() throws SQLException {
		SingerDao singerDaoImpl = new SingerDaoImpl();
		return singerDaoImpl.findCount();
	}

	@Override
	public List<Singer> getPage(int limit, int startIndex) throws SQLException {
		SingerDao singerDaoImpl = new SingerDaoImpl();
		return singerDaoImpl.findPage(limit, startIndex);
	}

	@Override
	//获取歌手的总人数和男性人数，计算出男性占人数的百分比并返回 
	public int getSingerMaleFemaleRatio() throws SQLException {
		SingerDao singerDaoImpl = new SingerDaoImpl();
		Long singerCount = singerDaoImpl.findCount();
		Long singerSexIsManCount = singerDaoImpl.findSexIsManCount();
		Double manRatio = (double) (singerSexIsManCount*100/singerCount);//计算出男性人数占总人数的百分之多少
		return (int)Math.round(manRatio);
	}

}
