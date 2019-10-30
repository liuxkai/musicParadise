package com.train.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.service.UserService;
import com.train.service.impl.UserServiceImpl;


public class ActiveController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code=request.getParameter("code");
		if(code != null && !code.equals("")) {
			UserService userService=new UserServiceImpl();
			try {
				if(userService.activeUser(code)){
					request.setAttribute("isActive", 1);  //1代表激活成功
					request.getRequestDispatcher("active.jsp").forward(request, response);
					//request.getRequestDispatcher("login.html").forward(request, response);
				}else{
					request.setAttribute("isActive", -1);  //-1代表激活失败
					request.getRequestDispatcher("active.jsp").forward(request, response);
					//request.getRequestDispatcher("register.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			request.setAttribute("isActive", -1);  //-1代表激活失败
			request.getRequestDispatcher("active.jsp").forward(request, response);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
