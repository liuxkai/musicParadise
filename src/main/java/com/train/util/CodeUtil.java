package com.train.util;

import java.util.UUID;
/**
 * 用于生成唯一激活码的工具类
 * @author liu'x'kai
 * @date 2019年10月23日
 */
public class CodeUtil {
	//生成唯一的激活码
	public static String generateUniqueCode(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
