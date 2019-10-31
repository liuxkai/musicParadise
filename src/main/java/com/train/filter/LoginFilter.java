package com.train.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.entity.User;

/**
 * 	登录验证过滤器
 */
public class LoginFilter implements Filter {

	// 不过滤页面
	private static String[] exceptPages = null;
	// 不过滤的方法
	private static String[] exceptMethods = null;
	// 不过滤的路径
	private static String[] exceptPaths = null;
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		User onlineUser = (User)httpRequest.getSession().getAttribute("onlineUser");
		
		if (filterCheck(httpRequest) && onlineUser == null) {
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.html");
		} else {
			chain.doFilter(request, response);
		}
		
	}

	/*
	 * 检查url地址是否需要过滤
	 */
	private boolean filterCheck(HttpServletRequest request) {
		
		String url = request.getRequestURL().toString();
		String method = request.getParameter("method");
		
		for (String page : exceptPages) {
			if (url.contains(page)) {
				return false;
			}
		}
		
		for (String methodStr : exceptMethods) {
			if (methodStr.equals(method)) {
				return false;
			}
		}
		
		for (String path : exceptPaths) {
			if (url.contains(path)) {
				return false;
			}
		}
		
		return true;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		// 从web.xml中获取配置信息
		String exceptPagesStr = fConfig.getInitParameter("exceptPages");
		String exceptMethodsStr = fConfig.getInitParameter("exceptMethods");
		String exceptPathsStr = fConfig.getInitParameter("exceptPaths");
		
		// 转换为数组赋值到变量
		if (exceptPagesStr != null) {
			if (exceptPagesStr.contains(",")) {
				exceptPages = exceptPagesStr.split(",");
			} else {
				exceptPages = new String[] {exceptPagesStr};
			}
		}
		if (exceptMethodsStr != null) {
			if (exceptMethodsStr.contains(",")) {
				exceptMethods = exceptMethodsStr.split(",");
			} else {
				exceptMethods = new String[] {exceptMethodsStr};
			}
		}
		if (exceptPathsStr != null) {
			if (exceptPathsStr.contains(",")) {
				exceptPaths = exceptPathsStr.split(",");
			} else {
				exceptPaths = new String[] {exceptPathsStr};
			}
		}
		
	}

	public void destroy() {
	}
}
