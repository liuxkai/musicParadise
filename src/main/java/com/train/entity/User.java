package com.train.entity;

import java.util.Date;

import com.train.enums.RoleEnum;
import com.train.enums.VipEnum;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 	用户类
 * @author junki
 * @date 2019年9月27日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
	
	private Long id;
	private RoleEnum role;//角色(管理员和普通用户)
	private String name;
	private Byte sex;     //1代表男,0代表女
	private Integer age;
	private String userName;
	private String passWord;
	private Date lastLoginTime;//问题待解决，不与数据库命名相同使用户DBUtil封装javaBean会不成功(已解决)
	private VipEnum vip;
	private String eMail;
	private Byte state;     //用户激活状态码,1为成功激活,0为没有激活
	private String code;    //用户注册后根据 UUID.randomUUID().toString().replaceAll("-", "")生成

}
