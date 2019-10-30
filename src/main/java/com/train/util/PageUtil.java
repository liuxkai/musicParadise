package com.train.util;

import java.util.ArrayList;
import java.util.List;
/**
 * 封装成layui需要格式工具类
 * 
 * @author liu'x'kai
 * @date 2019年10月21日
 */
public class PageUtil<T> {
	  
	 private int code=0;
	 private String msg="";
	 private Long count=1L; //总条数
	 private List<T> data = new ArrayList<>(); //装前台当前页的数据
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public PageUtil(int code, String msg, Long count, List<T> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
	public PageUtil() {
		super();
	}
	@Override
	public String toString() {
		return "PageUtil [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}
}