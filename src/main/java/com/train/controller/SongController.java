package com.train.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.train.entity.Singer;
import com.train.entity.Song;
import com.train.service.SingerService;
import com.train.service.SongService;
import com.train.service.impl.SingerServiceImpl;
import com.train.service.impl.SongServiceImpl;
import com.train.util.PageUtil;

import net.sf.json.JSONObject;

/**
 * 操作歌曲控制器
 */
@WebServlet("/SongController")
public class SongController extends HttpServlet {
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
		case "upload":
			upload(request, response);
			break;
		case "updataVV":
			try {
				updataVV(request, response);
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
		}	
	}

	private void updata(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String Rid = request.getParameter("Rid");
		String songId = request.getParameter("songId");
		Song song = new Song();
		if(Rid != null && !Rid.equals("")) {
			song.setRid(Long.valueOf(Rid));
		}
		if(songId != null && !songId.equals("")) {
			song.setSongId(Long.valueOf(songId));
		}
		SongService songServiceImpl = new SongServiceImpl(); 
		int result = songServiceImpl.updataBySongId(song);
		if(result == 1) {
			response.getWriter().print("<h1 style='color:blue;margin:100px;'>添加歌单成功！</h1>");
		}
		
	}

	private void updataPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		//从管理界面获取歌曲id，根据歌曲id修改歌曲所属歌单类型
		Long songId = Long.valueOf(request.getParameter("songId"));
		SongService songService = new SongServiceImpl();
		Song result = songService.getOne(Song.builder().songId(songId).build());
		request.setAttribute("song", result);
		request.getRequestDispatcher("songUpdata.jsp").forward(request, response);
	}


	private void updataVV(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		//接收前端ajax请求时带的数据songName，通过songName查询数据库并将该歌曲的播放量加一
		String songName = request.getParameter("songName");
		//System.out.println("songName63===="+songName);
		SongService songService = new SongServiceImpl();
		int result = songService.updataVVBySongName(Song.builder().songName(songName).build());
		if(result == 1) {
			System.out.println("歌曲播放量VV修改成功！");
		}
	}

	private void upload(HttpServletRequest request, HttpServletResponse response) {
		SongService songService = new SongServiceImpl();
		SingerService singerService = new SingerServiceImpl();
		Song song = new Song();
		Singer singer = new Singer();
		
		String realPath = request.getSession().getServletContext().getRealPath("/uploadmusic/");
		String lrcrealPath = request.getSession().getServletContext().getRealPath("/lrc/");
		String photorealPath = request.getSession().getServletContext().getRealPath("/photo/");
        File file = new File(realPath);
        //判断上传文件的保存目录是否存在
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(realPath + "目录不存在，需要创建");
            //创建目录
            file.mkdir();
        }
        File file2 = new File(lrcrealPath);
        //判断上传文件的保存目录是否存在
        if (!file2.exists() && !file2.isDirectory()) {
            System.out.println(lrcrealPath + "目录不存在，需要创建");
            //创建目录
            file2.mkdir();
        }
        File file3 = new File(photorealPath);
        //判断上传文件的保存目录是否存在
        if (!file3.exists() && !file3.isDirectory()) {
            System.out.println(photorealPath + "目录不存在，需要创建");
            //创建目录
            file3.mkdir();
        }
        //消息提示
        String message = "";
        try {
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            //3、判断提交上来的数据是否是上传表单的数据
            if (!ServletFileUpload.isMultipartContent(request)) {
                //按照传统方式获取数据
                return;
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            String ext = "";
            for (FileItem item : list) {
                //如果fileitem中封装的是普通输入项的数据
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "==================" + value);
                    if("singerName".equals(name)) {
                    	singer.setSingerName(value);
                    }
                    if("typeName".equals(name)) {
                    	song.setTypeName(value);
                    }
                    //获取歌曲名称，从数据库查询该歌曲，有对应的歌曲将歌词放进数据库中
                    if("songName".equals(name)) {
                    	song.setSongName(value);
                    }
                    //获取歌手名称，从数据库查询该歌手，有对应的歌手将照片放进数据库中
                    if("singerPhoto".equals(name)) {
                    	singer.setSingerName(value);;
                    }
                } else {//如果fileitem中封装的是上传文件
                    //得到上传的文件名称
                    String filename = item.getName();
                    System.out.println(filename);
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    String songName = filename.substring(0, filename.lastIndexOf("."));
                    song.setSongName(songName);
                    ext = filename.substring(filename.indexOf(".")+1) ;
                    System.out.println("文件格式"+ext);
                    InputStream in = null;
                    FileOutputStream out = null;
					if(ext.equals("mp3")) {
	                    //获取item中的上传文件的输入流
	                    in = item.getInputStream();
	                    //创建一个文件输出流
	                    out = new FileOutputStream(realPath +"/"+ filename);
	                    song.setUrl( "uploadmusic/"+ filename);
	                    //创建一个缓冲区
	                    byte buffer[] = new byte[1024];
	                    //判断输入流中的数据是否已经读完的标识
	                    int len = 0;
	                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
	                    while ((len = in.read(buffer)) > 0) {
	                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
	                        out.write(buffer, 0, len);
	                    }
					}  
					if(ext.equals("lrc")) {
	                    //获取item中的上传文件的输入流
	                    in = item.getInputStream();
	                    //创建一个文件输出流
	                    out = new FileOutputStream(lrcrealPath +"/"+ filename);
	                    song.setLrcUrl("lrc/"+ filename);
	                    //创建一个缓冲区
	                    byte buffer[] = new byte[1024];
	                    //判断输入流中的数据是否已经读完的标识
	                    int len = 0;
	                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
	                    while ((len = in.read(buffer)) > 0) {
	                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
	                        out.write(buffer, 0, len);
	                    }
					 }
					 if(ext.equals("jpg") || ext.equals("png")) {
	                    //获取item中的上传文件的输入流
	                    in = item.getInputStream();
	                    //创建一个文件输出流
	                    out = new FileOutputStream(photorealPath +"/"+ filename);
	                    singer.setPhotoUrl("photo/"+ filename);
	                    //创建一个缓冲区
	                    byte buffer[] = new byte[1024];
	                    //判断输入流中的数据是否已经读完的标识
	                    int len = 0;
	                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
	                    while ((len = in.read(buffer)) > 0) {
	                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
	                        out.write(buffer, 0, len);
	                    }
					  } 
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    message = "文件上传本地文件夹成功！";
                    System.out.println(message);
                }
            }
            PageUtil<Song> pageUtil = new PageUtil<>();
			pageUtil.setData(null);
			int code = 0;
            if(ext.equals("mp3")) {
            	//先添加一个歌手，然后返回歌手
            	song.setUploadDate(new Date());
            	Singer resultSinger = singerService.add(singer);   //此处缺少一个事务
            	//获得返回歌手的sid，然后添加歌曲
            	int resultSong = songService.add(song,resultSinger.getSid());
            	System.out.println(resultSong);
            	if(resultSong == 1) {
            		System.out.println("数据库添加数据成功");
            		code = 520;//上传成功，将code值设为520
            	}
            }else if(ext.equals("lrc")) {
            	//此时已经获得了歌曲的名字和歌词的路径，接下来要查询有没有此歌曲，有则添加歌词路径，没有则不添加
            	 int result = songService.addLrc(song);
            	 if(result == 1) {
            		 System.out.println("数据库添加数据成功");
            		 code = 520;//上传成功，将code值设为520
            	 }
            }else if(ext.equals("jpg") || ext.equals("png")) {
            	//此时已经获得了歌手的名字和歌手图片的路径，接下来要查询有没有此歌手，有则添加歌手图片路径，没有则不添加
            	int result = singerService.addPhoto(singer);
            	if(result == 1) {
            		System.out.println("数据库添加数据成功");
            		code = 520;//上传成功，将code值设为520
            	}
            }
            pageUtil.setCode(code);
            JSONObject json = JSONObject.fromObject(pageUtil);
            System.out.println(json);
            response.getWriter().print(json);
        } catch (Exception e) {
            message = "文件上传失败！";
            e.printStackTrace();
        }
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		int limit = Integer.parseInt(request.getParameter("limit")) ;   //获取前端传过来的页面大小
		int curr = Integer.parseInt(request.getParameter("page"));     //获取前端传过来的当前页
		int startIndex = (curr - 1) * limit;                             //计算出数据库查询开始下标
		System.out.println("SongController===261行"+limit+"--------------"+curr);
		Object onlineUser = request.getSession().getAttribute("onlineUser");
		if(onlineUser != null && !onlineUser.equals("")) {
			SongService songServiceImpl = new SongServiceImpl();
			Long count = songServiceImpl.getCount();//列表数据总数量
			System.out.println("SongCotroller======226行  列表数据总数量"+count);
			List<Song> songList = songServiceImpl.getPage(limit,startIndex);//分页查询，根据页面大小和当前页面取数据库中查询所需歌曲
			//List<Song> songList = songServiceImpl.getAll();
			PageUtil<Song> pageUtil = new PageUtil<>();
			pageUtil.setData(songList); 
			pageUtil.setCount(count);//设置列表数据总数量
			JSONObject json = JSONObject.fromObject(pageUtil);
			System.out.println(json);
			response.getWriter().print(json);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
