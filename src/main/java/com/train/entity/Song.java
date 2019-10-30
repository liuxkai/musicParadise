package com.train.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Song {
	private Long songId;//歌曲id
	private String songName;//歌曲名称
	private String singerName;//歌曲作者
	private String typeName;//歌曲类型
	private Long VV;//歌曲点击量
	private String url;//歌曲保存路径
	private String lrcUrl;//歌词保存路径
	private Date uploadDate;//上传歌曲日期
	private Long Rid;
}
