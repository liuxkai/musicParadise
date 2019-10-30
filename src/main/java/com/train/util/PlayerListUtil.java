package com.train.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用于封装cov,voi,tit,lrcUrl,inf等字段,然后转换为json数组给player.jsp中的ajax请求提供接口
 * @author liu'x'kai
 * @date 2019年10月23日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PlayerListUtil {
	private String cov;   //歌手图片地址
	private String voi;    //歌曲地址
	private String tit;    //歌名
	private String lrcUrl;  //歌词地址
	private String inf;    //歌手信息
}
