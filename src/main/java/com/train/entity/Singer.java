package com.train.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Singer {
	private Long Sid;
	private String singerName;
	private Integer sex;
	//解决net.sf.json.JSONException: java.lang.reflect.InvocationTargetException（原因：从数据库里读出来的是java.sql.Date赋值给了java.util.Date.转化成JSONArray时出错）
	//方式一：将birthday类型Data写成String
	//方式二：使用public Date getPdate() {return new java.util.Date(pdate.getTime());}进行封装
	private String birthday;
	private String hobby;   //歌手爱好
	private String photoUrl;//歌手照片保存路径
	
}
