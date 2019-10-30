package com.train.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.entity.Singer;
import com.train.service.SingerService;
import com.train.service.impl.SingerServiceImpl;
import com.train.util.PageUtil;

import net.sf.json.JSONObject;

@WebServlet("/SingerController")
public class SingerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		switch (method){
		case "query":
			try {
				query(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "updataPage":
			try {
				updataPage(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "updata":
			try {
				updata(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		}	
	}
	private void updata(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String Sid = request.getParameter("Sid");
		String sex = request.getParameter("sex");
		String singerName = request.getParameter("singerName");
		String birthday = request.getParameter("birthday");
		String hobby = request.getParameter("hobby");
		Singer singer = new Singer();
		if(Sid != null && !Sid.equals("")) {
			singer.setSid(Long.valueOf(Sid));
		}
		if(sex != null && !sex.equals("")) {
			singer.setSex(Integer.valueOf(sex));
		}
		if(singerName != null && !singerName.equals("")) {
			singer.setSingerName(singerName);
		}
		if(birthday != null && !birthday.equals("")) {
			singer.setBirthday(birthday);
		}
		if(hobby != null && !hobby.equals("")) {
			singer.setHobby(hobby);
		}
		//System.out.println("SingerController   73行"+singer);
		SingerService singerServiceImpl = new SingerServiceImpl(); 
		int result = singerServiceImpl.updata(singer);
		if(result == 1) {
			response.getWriter().print("<h1 style='color:blue;margin:100px;'>歌手信息修改成功！</h1>");
		}
	}
	private void updataPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		Long Sid = Long.valueOf(request.getParameter("Sid"));//从backstageList歌手列表的编辑窗口请求url地址获取歌手sid
		SingerService singerService = new SingerServiceImpl();
		Singer result = singerService.getOne(Singer.builder().Sid(Sid).build());
		//System.out.println("SingerController   83行"+result);
		request.setAttribute("singer", result);
		request.getRequestDispatcher("singerUpdata.jsp").forward(request, response);
	}
	private void query(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int limit = Integer.parseInt(request.getParameter("limit")) ;   //获取前端传过来的页面大小
		int curr = Integer.parseInt(request.getParameter("page"));     //获取前端传过来的当前页
		int startIndex = (curr - 1) * limit;                             //计算出数据库查询开始下标
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			SingerService singerServiceImpl = new SingerServiceImpl();
			Long count = singerServiceImpl.getCount();//列表数据总数量
			List<Singer> singerList = singerServiceImpl.getPage(limit,startIndex);
			PageUtil<Singer> pageUtil = new PageUtil<>();
			pageUtil.setData(singerList);
			pageUtil.setCount(count);
			JSONObject json = JSONObject.fromObject(pageUtil);
			//System.out.println(json);
			response.getWriter().print(json);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
