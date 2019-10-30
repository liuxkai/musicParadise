package com.train.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.entity.User;
import com.train.enums.RoleEnum;
import com.train.service.UserService;
import com.train.service.impl.UserServiceImpl;
import com.train.util.CodeUtil;
import com.train.util.MailUtil;
import com.train.util.PageUtil;
import com.train.util.RetrieveUtil;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		switch (method){
		case "login" : 
			try {
				login(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "logout":
			logout(request, response);
			break;	
		case "register" :
			try {
				register(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "query":
			try {
				query(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "querySome":
			try {
				querySome(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "retrieve":                      //找回密码功能
			try {
				retrievePassword(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	private void retrievePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		Integer age = Integer.valueOf(request.getParameter("age"));
		
		//利用正则表达式（可改进）验证邮箱是否符合邮箱的格式
		if(!email.matches("^\\w+@(\\w+\\.)+\\w+$")){
			response.sendRedirect("active.jsp");
		}
		//查询该用户是否存在
		UserService userServiceImpl = new UserServiceImpl();
		User result = userServiceImpl.getOne(User.builder().name(name).age(age).userName(username).eMail(email).build());
		if (result != null) {
			new Thread(new RetrieveUtil(email, result.getPassWord())).start();
			request.getRequestDispatcher("login.html").forward(request, response);
		} else {
			response.sendRedirect("retrieve.jsp");
		}
		
	}
	private void querySome(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String sexForm= request.getParameter("sex");
		String stateForm = request.getParameter("state");
		Byte sex = null;
		if(sexForm != null && !sexForm.equals("")) {
			sex = Byte.valueOf(sexForm); 
		}
		Byte state = null;
		if(stateForm != null && !stateForm.equals("")) {
			state = Byte.valueOf(stateForm); 
		}
		UserService userServiceImpl = new UserServiceImpl();
		List<User> users = userServiceImpl.getSome(User.builder().sex(sex).state(state).build());
		PageUtil<User> pageUtil = new PageUtil<>();
		pageUtil.setData(users);
		JSONObject json = JSONObject.fromObject(pageUtil);
		response.getWriter().print(json);
	}
	//通过一个用户查询所用用户信息
	private void query(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int limit = Integer.parseInt(request.getParameter("limit")) ;   //获取前端传过来的页面大小
		int curr = Integer.parseInt(request.getParameter("page"));     //获取前端传过来的当前页
		int startIndex = (curr - 1) * limit;                             //计算出数据库查询开始下标
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			UserService userServiceImpl = new UserServiceImpl();
			Long count = userServiceImpl.getCount();//列表数据总数量
			List<User> userList = userServiceImpl.getPage((User)onlineUser, limit, startIndex);
			PageUtil<User> pageUtil = new PageUtil<>();
			pageUtil.setData(userList);  
			pageUtil.setCount(count);
			JSONObject json = JSONObject.fromObject(pageUtil);
			response.getWriter().print(json);
		}
	}
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("onlineUser");
		// 动态获取项目路径，退出登录后直接重定向到项目欢迎页。
		response.sendRedirect(request.getContextPath());	
		
	}
	private void register(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		// 这里可以验证各字段是否为空
		//利用正则表达式（可改进）验证邮箱是否符合邮箱的格式
		if(!email.matches("^\\w+@(\\w+\\.)+\\w+$")){
			response.sendRedirect("register.jsp");
		}
		Byte sex = Byte.valueOf(request.getParameter("sex"));
		Integer age = Integer.valueOf(request.getParameter("age"));
		//生成激活码
		String code=CodeUtil.generateUniqueCode();
		
		//将用户保存到数据库
		UserService userServiceImpl = new UserServiceImpl();
		int result = userServiceImpl.add(User.builder().name(name).sex(sex).age(age).userName(username).passWord(password).eMail(email).state((byte)0).code(code).role(RoleEnum.USER).build());
		if (result == 1) {
			// 转发
			//request.setAttribute("message", "注册成功");
			//request.setAttribute("username", username);
			//request.setAttribute("password", password);
			//保存成功则通过线程的方式给用户发送一封邮件
			new Thread(new MailUtil(email, code)).start();
			request.getRequestDispatcher("login.html").forward(request, response);
		} else {
			response.sendRedirect("register.jsp");
		}
	}
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username == null || username.equals("") || password == null || password.equals("")) {
			request.setAttribute("message", "账号或密码有误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			UserService userServiceImpl = new UserServiceImpl();
			User result = userServiceImpl.getOne(User.builder().userName(username).passWord(password).build());
			System.out.println("login这里"+result);
			if(result != null) {
				if(Byte.valueOf(result.getState()) == 0) {
					request.setAttribute("message", "您的账号还没有激活,请激活后使用");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				// 修改最后登录时间
				result.setLastLoginTime(new Date());
				userServiceImpl.update(result);
				// 用户登录成功后，把当前用户信息存储到session域中
				request.getSession().setAttribute("onlineUser", result);
				
				//判断是否勾上了记住我
				String rememberMe = request.getParameter("rememberMe");
				Cookie usernameCookie = new Cookie("username", null);
				Cookie passwordCookie = new Cookie("password", null);
				Cookie rememberMeCookie = new Cookie("rememberMe", null);
				if("1".equals(rememberMe)) {
					usernameCookie = new Cookie("username", username);
					passwordCookie = new Cookie("password", password);
					rememberMeCookie = new Cookie("rememberMe", rememberMe);
					// 默认情况下，cookie的生命周期和session类似，关闭浏览器丢失。
					// 一般需要手动设置存活时间，单位：秒。从生成cookie开始计算时间
					usernameCookie.setMaxAge(60 * 60 * 24 * 7);
					passwordCookie.setMaxAge(60 * 60 * 24 * 7);
					rememberMeCookie.setMaxAge(60 * 60 * 24 * 7);
				}else {
					// 一般清除cookie会将相同name的cookie设置存活时间为0
					usernameCookie.setMaxAge(0);
					passwordCookie.setMaxAge(0);
					rememberMeCookie.setMaxAge(0);
				}
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				response.addCookie(rememberMeCookie);
				if(result.getRole().toString().equals("ADMIN")) {
					//如果返回的角色是管理员用户则跳入后台管理页面
					//response.sendRedirect("backstageList.jsp");
					response.getWriter().write("1");
				}else {
					//如果返回的角色是普通用户则跳入用户首页
					//response.sendRedirect("backstageList?method=query");
					response.getWriter().write("2");
					return;
				}
				
			}else {
				request.setAttribute("message", "账号或密码有误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				System.out.println("paole");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
