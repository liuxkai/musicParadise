package com.train.util;

import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * 	数据库连接池工具类
 * @author junki
 * @date 2019年9月28日
 */
public class DataSourceUtil {
	
	// 保证整个项目使用同一个连接池
	private static DataSource dataSource = null;
	
	// 初始化连接池配置
	static {
		Properties properties = new Properties();
		try {
			properties.load(DataSourceUtil.class.getClassLoader().getResourceAsStream("druid.properties"));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		try {
			dataSource = DruidDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 获取连接池对象的方法
	public static DataSource getDataSource() {
		return dataSource;
	}
	
}
