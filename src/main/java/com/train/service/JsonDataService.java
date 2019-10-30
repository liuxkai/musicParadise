package com.train.service;

import java.sql.SQLException;
import java.util.List;

import com.train.entity.JsonData;
import com.train.entity.Song;

public interface JsonDataService {
	//根据歌曲类型tid多表连接查询出经典歌曲，摇滚歌曲，儿童歌曲，流行歌曲
	List<JsonData> findMusicTypeList(int tid) throws SQLException;
	//根据歌曲的上传时间多表查询出最新歌曲，quantity是要查询出的歌曲数量
	List<JsonData> findNewMusicTypeList(int quantity) throws SQLException;
	//根据搜索内容多表模糊查询出歌曲列表，keyword是查询歌曲名或歌手名条件的关键字
	List<JsonData> findMusicListBySearchMusic(String keyword) throws SQLException;
	//查询出歌曲播放量排行前十的歌曲
	List<Song> findMusicByRankingMusic() throws SQLException;
	//根据歌曲名查出该歌曲，songName是要查询的歌曲名
	List<JsonData> findMusicOneBySongName(String songName) throws SQLException;
	//根据推荐歌单Rid查出所有指定Rid的歌曲
	List<JsonData> findMusicListByRid(Long rid) throws SQLException;

}
