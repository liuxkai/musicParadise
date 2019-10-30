package com.train.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.train.dao.JsonDataDao;
import com.train.entity.JsonData;
import com.train.entity.Song;
import com.train.util.DataSourceUtil;

public class JsonDataDaoImpl implements JsonDataDao {

	@Override
	public List<JsonData> selectList(int tid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于查询不同类型歌曲信息及歌手的sql语句
		String sql = "SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url,album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url FROM song WHERE Tid = ?) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<JsonData> result = qr.query(sql, new BeanListHandler<>(JsonData.class, new BasicRowProcessor(new GenerousBeanProcessor())), tid);
		return result;
	}

	@Override
	public List<JsonData> selectNewList(int quantity) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于查询最近上传的歌曲信息及歌手的sql语句
		String sql = "SELECT c.song_name, c.url, c.lrc_url, c.singer_name, c.sex, c.birthday, c.hobby, c.photo_url, c.album_name, c.album_introduce FROM (SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url, b.upload_date, album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, a.upload_date, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url, upload_date FROM song) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid) AS c ORDER BY upload_date desc LIMIT ?";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<JsonData> result = qr.query(sql, new BeanListHandler<>(JsonData.class, new BasicRowProcessor(new GenerousBeanProcessor())), quantity);
		return result;
	}

	@Override
	public List<JsonData> selectListBySearch(String keyword) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于根据关键字查询歌曲信息及歌手的sql语句
		String sql = "SELECT c.song_name, c.url, c.lrc_url, c.singer_name, c.sex, c.birthday, c.hobby, c.photo_url, c.album_name, c.album_introduce FROM (SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url, b.upload_date, album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, a.upload_date, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url, upload_date FROM song) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid) AS c WHERE song_name LIKE ? OR singer_name LIKE ? ";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<JsonData> result = qr.query(sql, new BeanListHandler<>(JsonData.class, new BasicRowProcessor(new GenerousBeanProcessor())), "%"+keyword+"%", "%"+keyword+"%");//注:将%写入sql语句中搜索关键字必定要被''套住('% ? %'和'%' ? '%')测试都不行,最终方法将%传进去,拼接进去也可，但不推荐，因为不安全
		return result;
	}

	@Override
	public List<Song> selectMusicByVV() throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于根据关键字查询歌曲信息及歌手的sql语句
		String sql = "SELECT a.song_id, a.song_name, b.singer_name, c.type_name, a.VV, a.url, a.lrc_url FROM `song` AS a, `singer` AS b, `type` AS c WHERE a.Sid = b.Sid AND a.Tid = c.Tid ORDER BY VV desc LIMIT 10";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<Song> result = qr.query(sql, new BeanListHandler<>(Song.class, new BasicRowProcessor(new GenerousBeanProcessor())));
		return result;
	}

	@Override
	public List<JsonData> selectMusicOneBySongName(String songName) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于根据歌曲名查询出歌曲的sql语句
		String sql = "SELECT c.song_name, c.url, c.lrc_url, c.singer_name, c.sex, c.birthday, c.hobby, c.photo_url, c.album_name, c.album_introduce FROM (SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url, b.upload_date, album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, a.upload_date, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url, upload_date FROM song WHERE song_name = ?) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid) AS c ";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<JsonData> result = qr.query(sql, new BeanListHandler<>(JsonData.class, new BasicRowProcessor(new GenerousBeanProcessor())), songName);
		return result;
	}

	@Override
	public List<JsonData> selectMusicListByRid(Long rid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtil.getDataSource());
		//用于根据Rid查询出所有歌曲的sql语句
		String sql = "SELECT c.song_name, c.url, c.lrc_url, c.singer_name, c.sex, c.birthday, c.hobby, c.photo_url, c.album_name, c.album_introduce FROM (SELECT b.song_name, b.url, b.lrc_url, b.singer_name, b.sex, b.birthday,b.hobby, b.photo_url, b.upload_date, album_name, album_introduce FROM (SELECT a.song_name, a.url, a.lrc_url, a.Sid, a.upload_date, singer_name, sex, birthday,hobby, photo_url FROM (SELECT Sid, song_name, url, lrc_url, upload_date FROM song WHERE Rid = ?) AS a, singer WHERE a.Sid = singer.Sid) AS b LEFT JOIN album ON album.Sid = b.Sid) AS c ";
		//new BasicRowProcessor(new GenerousBeanProcessor()))解决数据库_命名与java小驼峰命名的冲突问题
		List<JsonData> result = qr.query(sql, new BeanListHandler<>(JsonData.class, new BasicRowProcessor(new GenerousBeanProcessor())), rid);
		return result;
	}

}











