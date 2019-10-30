package com.train.entity;

import java.util.Date;

import com.train.entity.Singer.SingerBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用于封装
 * song_name, url, lrc_url, singer_name, sex, birthday,
 * hobby, photo_url,album_name, album_introduce,然后将数据放到工具类里传入前台
 * @author liu'x'kai
 * @date 2019年10月24日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JsonData {
	private String songName;
	private String url;
	private String lrcUrl;
	private String singerName;
	private Integer sex;
	private String birthday;
	private String hobby;
	private String photoUrl;
	private String albumName;
	private String albumIntroduce;
}
