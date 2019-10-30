package com.train.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.train.entity.JsonData;
import com.train.entity.Song;
import com.train.service.JsonDataService;
import com.train.service.SingerService;
import com.train.service.UserService;
import com.train.service.impl.JsonDataServiceImpl;
import com.train.service.impl.SingerServiceImpl;
import com.train.service.impl.UserServiceImpl;
import com.train.util.PlayerListUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * json数据接口，用来或取数据库中歌曲信息（如：歌手照片地址，歌曲地址，歌曲名称，歌词地址，歌手信息）
 */
@WebServlet("/JsonDataInterface")
public class JsonDataInterface extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String method = request.getParameter("method");
		switch (method){
		case "newMusic":     //请求最新音乐最近上传10条
			try {
				newMusicTypeList(request, response);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;	
		case "fashionMusic":    //请求流行音乐
			try {
				musicTypeList(request, response, 4);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "classicsMusic":    //请求经典音乐
			try {
				musicTypeList(request, response, 1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "rockMusic":        //请求摇滚音乐
			try {
				musicTypeList(request, response, 2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "childrenMusic":     //请求儿童音乐
			try {
				musicTypeList(request, response, 3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;	
		case "searchMusic":        //搜索栏中搜索音乐或歌手
			try {
				searchMusicList(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "rankingMusic":        //请求歌曲播放量排名前十的歌曲名	
			try {
				rankingMusic(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "rankingSongName":	     //通过musicparadise页面传过来要查询歌曲排名的歌曲名去数据库查询所需要的歌曲到播放器
			try {
				rankingSongName(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "recommend":           //播放器请求指定推荐歌单的歌曲
			try {
				recommendSongMenu(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case"maleFemaleRatio":       //管理员后台页面获取用户及歌手男性人数和总数，计算出男女比例
			try {
				maleFemaleRatio(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	private void maleFemaleRatio(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			//获取用户的总数和男性人数计算出男女比例
			UserService userServiceImpl = new UserServiceImpl();
			int usermaleFemaleRatio = userServiceImpl.getUserMaleFemaleRatio();
			//System.out.println("用户男性---"+usermaleFemaleRatio);
			//System.out.println("用户女性---"+(100-usermaleFemaleRatio));
			//获取歌手的总数和男性人数计算出男女比例
			SingerService singerServiceImpl = new SingerServiceImpl();
			int singermaleFemaleRatio = singerServiceImpl.getSingerMaleFemaleRatio();
			//System.out.println("歌手男性---"+singermaleFemaleRatio);
			//System.out.println("歌手女性---"+(100-singermaleFemaleRatio));
			Map<String, Integer> hashMap = new HashMap<String, Integer>();
			hashMap.put("userMan", usermaleFemaleRatio);
			hashMap.put("userWoman", (100-usermaleFemaleRatio));
			hashMap.put("singerMan", singermaleFemaleRatio);
			hashMap.put("singerWoman", (100-singermaleFemaleRatio));
			JSONObject array=JSONObject.fromObject(hashMap);
			System.out.println("将类转为json对象 JsonDataInterface  第130行  "+array.toString());
			response.getWriter().print(array);
		}
		
	}
	private void recommendSongMenu(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		//前端加载页面(player.jsp)时发出ajax请求，根基Rid获取指定推荐歌单的歌曲
		String Rid = request.getParameter("Rid");
		Long rid = null;
		if(Rid != null && !Rid.equals("")) {
			rid = Long.parseLong(Rid);
		}
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<JsonData> jsonDataList = jsonDataServiceImpl.findMusicListByRid(rid);
			List<PlayerListUtil> playerList = new ArrayList<>();
			for(JsonData jsonData:jsonDataList){
				PlayerListUtil playerListUtil = null;
				if(jsonData != null) {
					playerListUtil = PlayerListUtil.builder()
							.cov(jsonData.getPhotoUrl())
							.voi(jsonData.getUrl())
							.tit(jsonData.getSongName())
							.lrcUrl(jsonData.getLrcUrl())
							.inf("姓名:"+(jsonData.getSingerName() == null ? "" : jsonData.getSingerName()) +"<br/><br/>性别:"+(((jsonData.getSex() == null ? 0 : jsonData.getSex()) == 1 ? "男" : "女")+"<br/><br/>出生日期:"+jsonData.getBirthday() == null ? "" : jsonData.getBirthday()) +"<br/><br/>爱好:"+(jsonData.getHobby() == null ? "" : jsonData.getHobby()) +"<br/><br/>专辑:"+(jsonData.getAlbumName() == null ? "" : jsonData.getAlbumName()) +"<br/><br/>专辑介绍:"+(jsonData.getAlbumIntroduce() == null ? "" : jsonData.getAlbumIntroduce())).build();
					playerList.add(playerListUtil);
				}
			}	 
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(playerList);    
			System.out.println("将类转为json对象 JsonDataInterface  第123行  "+array.toString());
			response.getWriter().print(array);
		}
		
	}
	private void rankingSongName(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		//前端加载页面(player.jsp)时发出ajax请求，获取歌曲播放量排名前十的歌曲
		String songName = request.getParameter("songName");
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<JsonData> jsonDataList = jsonDataServiceImpl.findMusicOneBySongName(songName);//传进去的是显示最近添加的音乐数量(传值目的为了后期增加功能)
			List<PlayerListUtil> playerList = new ArrayList<>();
			//System.out.println(jsonDataList);
			for(JsonData jsonData:jsonDataList){
				PlayerListUtil playerListUtil = null;
				if(jsonData != null) {
					playerListUtil = PlayerListUtil.builder()
							.cov(jsonData.getPhotoUrl())
							.voi(jsonData.getUrl())
							.tit(jsonData.getSongName())
							.lrcUrl(jsonData.getLrcUrl())
							.inf("姓名:"+(jsonData.getSingerName() == null ? "" : jsonData.getSingerName()) +"<br/><br/>性别:"+(((jsonData.getSex() == null ? 0 : jsonData.getSex()) == 1 ? "男" : "女")+"<br/><br/>出生日期:"+jsonData.getBirthday() == null ? "" : jsonData.getBirthday()) +"<br/><br/>爱好:"+(jsonData.getHobby() == null ? "" : jsonData.getHobby()) +"<br/><br/>专辑:"+(jsonData.getAlbumName() == null ? "" : jsonData.getAlbumName()) +"<br/><br/>专辑介绍:"+(jsonData.getAlbumIntroduce() == null ? "" : jsonData.getAlbumIntroduce())).build();
					playerList.add(playerListUtil);
				}
			}	 
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(playerList);    
			System.out.println("将类转为json对象 JsonDataInterface  第151行  "+array.toString());
			response.getWriter().print(array);
		}
		
	}
	private void rankingMusic(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		//前端加载页面(musicparadise.jsp)时发出ajax请求，获取歌曲播放量排名前十的歌曲名
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<Song> songList = jsonDataServiceImpl.findMusicByRankingMusic();
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(songList);    
			System.out.println("将类转为json对象 JsonDataInterface  第164行  "+array.toString());
			response.getWriter().print(array);
		}
		
	}
	private void searchMusicList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String keyword = request.getParameter("keyword");//前端ajax通过url地址发送过来的搜索关键字（keyword）
		//通过关键字去查询数据库,查询出来的数据封装成json写到该接口,前端判断是否请求到数据，请求到数据就跳转到播放界面，没请求到就在当前页面不动
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<JsonData> jsonDataList = jsonDataServiceImpl.findMusicListBySearchMusic(keyword);//传进去的是显示最近添加的音乐数量(传值目的为了后期增加功能)
			List<PlayerListUtil> playerList = new ArrayList<>();
			//System.out.println(jsonDataList);
			for(JsonData jsonData:jsonDataList){
				PlayerListUtil playerListUtil = null;
				if(jsonData != null) {
					playerListUtil = PlayerListUtil.builder()
							.cov(jsonData.getPhotoUrl())
							.voi(jsonData.getUrl())
							.tit(jsonData.getSongName())
							.lrcUrl(jsonData.getLrcUrl())
							.inf("姓名:"+(jsonData.getSingerName() == null ? "" : jsonData.getSingerName()) +"<br/><br/>性别:"+(((jsonData.getSex() == null ? 0 : jsonData.getSex()) == 1 ? "男" : "女")+"<br/><br/>出生日期:"+jsonData.getBirthday() == null ? "" : jsonData.getBirthday()) +"<br/><br/>爱好:"+(jsonData.getHobby() == null ? "" : jsonData.getHobby()) +"<br/><br/>专辑:"+(jsonData.getAlbumName() == null ? "" : jsonData.getAlbumName()) +"<br/><br/>专辑介绍:"+(jsonData.getAlbumIntroduce() == null ? "" : jsonData.getAlbumIntroduce())).build();
					playerList.add(playerListUtil);
				}
			}	 
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(playerList);    
			System.out.println("将类转为json对象 JsonDataInterface  第192行  "+array.toString());
			response.getWriter().print(array);
		}
		
	}
	//查询最近添加的10首歌曲，根据upload_date查询
	private void newMusicTypeList(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<JsonData> jsonDataList = jsonDataServiceImpl.findNewMusicTypeList(10);//传进去的是显示最近添加的音乐数量(传值目的为了后期增加功能)
			List<PlayerListUtil> playerList = new ArrayList<>();
			//System.out.println(jsonDataList);
			for(JsonData jsonData:jsonDataList){
				PlayerListUtil playerListUtil = null;
				if(jsonData != null) {
					playerListUtil = PlayerListUtil.builder()
							.cov(jsonData.getPhotoUrl())
							.voi(jsonData.getUrl())
							.tit(jsonData.getSongName())
							.lrcUrl(jsonData.getLrcUrl())
							.inf("姓名:"+(jsonData.getSingerName() == null ? "" : jsonData.getSingerName()) +"<br/><br/>性别:"+(((jsonData.getSex() == null ? 0 : jsonData.getSex()) == 1 ? "男" : "女")+"<br/><br/>出生日期:"+jsonData.getBirthday() == null ? "" : jsonData.getBirthday()) +"<br/><br/>爱好:"+(jsonData.getHobby() == null ? "" : jsonData.getHobby()) +"<br/><br/>专辑:"+(jsonData.getAlbumName() == null ? "" : jsonData.getAlbumName()) +"<br/><br/>专辑介绍:"+(jsonData.getAlbumIntroduce() == null ? "" : jsonData.getAlbumIntroduce())).build();
					playerList.add(playerListUtil);
				}
			}	 
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(playerList);    
			//System.out.println("将类转为json对象  "+array.toString()); 
			response.getWriter().print(array);
		}
		
	}
	/**
	 * 要获取的字段：
	 * cov:歌手图片url
	 * voi:歌曲url
	 * tit:歌曲名称
	 * lrcUrl:歌词url
	 * inf:歌手介绍
	 * @throws SQLException 
	 * @throws IOException 
	 * 
	 */
	private void musicTypeList(HttpServletRequest request, HttpServletResponse response, int tid) throws SQLException, IOException {
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			//调用service层，难点编写多表查询的sql语句，将上诉字段查询出来后封装成json数据作为接口数据
			JsonDataService jsonDataServiceImpl = new JsonDataServiceImpl();
			List<JsonData> jsonDataList = jsonDataServiceImpl.findMusicTypeList(tid);
			List<PlayerListUtil> playerList = new ArrayList<>();
			//System.out.println(jsonDataList);
			for(JsonData jsonData:jsonDataList){
				System.out.println("JsonDataInterface第244行--"+jsonData);
				PlayerListUtil playerListUtil = null;
				if(jsonData != null) {
					playerListUtil = PlayerListUtil.builder()
							.cov(jsonData.getPhotoUrl())
							.voi(jsonData.getUrl())
							.tit(jsonData.getSongName())
							.lrcUrl(jsonData.getLrcUrl())
							.inf("姓名:"+(jsonData.getSingerName() == null ? "" : jsonData.getSingerName()) +"<br/><br/>性别:"+(((jsonData.getSex() == null ? 0 : jsonData.getSex()) == 1 ? "男" : "女")+"<br/><br/>出生日期:"+jsonData.getBirthday() == null ? "" : jsonData.getBirthday()) +"<br/><br/>爱好:"+(jsonData.getHobby() == null ? "" : jsonData.getHobby()) +"<br/><br/>专辑:"+(jsonData.getAlbumName() == null ? "" : jsonData.getAlbumName()) +"<br/><br/>专辑介绍:"+(jsonData.getAlbumIntroduce() == null ? "" : jsonData.getAlbumIntroduce())).build();
					playerList.add(playerListUtil);
				}
			}	 
			//将类转为json对象    
			JSONArray array=JSONArray.fromObject(playerList);    
			//System.out.println("将类转为json对象  "+array.toString()); 
			System.out.println("来到了JsonDataInterface界面259行");
			System.out.println("将类转为json对象  "+array.toString());
			response.getWriter().print(array);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
