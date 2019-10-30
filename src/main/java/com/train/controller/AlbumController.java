package com.train.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.entity.Album;
import com.train.service.AlbumService;
import com.train.service.impl.AlbumServiceImpl;
import com.train.util.PageUtil;

import net.sf.json.JSONObject;

@WebServlet("/AlbumController")
public class AlbumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		switch (method){
		case "query":        //查询所有专辑
			try {
				query(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "updataPage":    //通过专辑id查找专辑并跳转到修改专辑页面
			try {
				updataPage(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "updata":   //修改专辑
			try {
				updata(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "add":     //添加专辑	
			try {
				add(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		}
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String Aid = request.getParameter("Aid");
		String albumName = request.getParameter("albumName");
		String singerName = request.getParameter("singerName");
		String albumIntroduce = request.getParameter("albumIntroduce");
		Album album = new Album();
		if(Aid != null && !Aid.equals("")) {
			album.setAid(Long.valueOf(Aid));
		}
		if(albumIntroduce != null && !albumIntroduce.equals("")) {
			album.setAlbumIntroduce(albumIntroduce);
		}
		if(albumName != null && !albumName.equals("")) {
			album.setAlbumName(albumName);
		}
		if(singerName != null && !singerName.equals("")) {
			album.setSingerName(singerName);
		}
		AlbumService albumServiceImpl = new AlbumServiceImpl(); 
		int result = albumServiceImpl.add(album);    //添加专辑前要先在service层判断要添加专辑的歌手存不存在，不存在则不添加
		if(result == 1) {
			response.getWriter().print("<h1 style='color:blue;margin:100px;'>专辑添加成功！</h1>");
		}else {
			response.getWriter().print("<h1 style='color:blue;margin:100px;'>专辑添加失败！没有此歌手！</h1>");
		}
	}

	private void updata(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String Aid = request.getParameter("Aid");
		String albumName = request.getParameter("albumName");
		//String singerName = request.getParameter("singerName");修改专辑是不需要修改歌手名字，因为目的就是修改歌手的专辑
		String albumIntroduce = request.getParameter("albumIntroduce");
		Album album = new Album();
		if(Aid != null && !Aid.equals("")) {
			album.setAid(Long.valueOf(Aid));
		}
		if(albumIntroduce != null && !albumIntroduce.equals("")) {
			album.setAlbumIntroduce(albumIntroduce);
		}
		if(albumName != null && !albumName.equals("")) {
			album.setAlbumName(albumName);
		}
		//System.out.println("AlbumController   99行"+Album);
		AlbumService albumServiceImpl = new AlbumServiceImpl(); 
		int result = albumServiceImpl.updata(album);
		if(result == 1) {
			response.getWriter().print("<h1 style='color:blue;margin:100px;'>专辑信息修改成功！</h1>");
		}
	}

	private void updataPage(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		Long aid = Long.valueOf(request.getParameter("Aid"));//从backstageList专辑列表的编辑窗口请求url地址获取专辑aid
		AlbumService albumService = new AlbumServiceImpl();
		Album result = albumService.getOne(Album.builder().Aid(aid).build());
		//System.out.println("AlbumController  55行"+result);
		request.setAttribute("album", result);
		request.getRequestDispatcher("albumUpdata.jsp").forward(request, response);
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		int limit = Integer.parseInt(request.getParameter("limit")) ;   //获取前端传过来的页面大小
		int curr = Integer.parseInt(request.getParameter("page"));     //获取前端传过来的当前页
		int startIndex = (curr - 1) * limit;                             //计算出数据库查询开始下标
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			AlbumService albumServiceImpl = new AlbumServiceImpl();
			Long count = albumServiceImpl.getCount();//列表数据总数量
			List<Album> albumList = albumServiceImpl.getPage(limit, startIndex);
			PageUtil<Album> pageUtil = new PageUtil<>();
			pageUtil.setData(albumList);
			pageUtil.setCount(count);
			JSONObject json = JSONObject.fromObject(pageUtil);
			//System.out.println("AlbumController层，第129行--"+json);
			response.getWriter().print(json);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
