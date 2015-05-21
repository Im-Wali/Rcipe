package com.rcipe.web.commons;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rcipe.commons.FileUtil;
import com.rcipe.service.commons.FileService;
import com.rcipe.service.domain.User;
import com.sun.org.apache.bcel.internal.generic.RETURN;

/*
 * 파일 업로드Test class 일단 file upload위치는 C:\\fileUploadTest폴더 밑으로 했고 일단 확장자가 JPG만 할수 있게 해놨다.
 */

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	@Qualifier("fileServiceImpl")
	FileService fileService;
	
	@Autowired
	private ServletContext ctx;
	
	@RequestMapping("uploadBoard")
	public  void  uploadBoard(HttpServletRequest request,
			HttpSession session,HttpServletResponse response) throws Exception {
		String sFunc = request.getParameter("CKEditorFuncNum");
		// 여기에 회원 별로 관리할수 있는 부분
//		User user=(User)session.getAttribute("user");
		User user=new User("user01","user01@naver.com","1111","!!!!");
		String projectPath="http://"+java.net.InetAddress.getLocalHost().getHostAddress()+":"+request.getServerPort()+"/rcipe/images/";
		// File("c:\\fileUploadTest\\user"+user.getNickname"+"\\profile");
		PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
		File newFile=new File(ctx.getRealPath("/images")+"/"+user.getNickname());
		if(!newFile.isDirectory()){
			newFile.mkdirs();
		}
		  Map<String,String> map=null;
		try{
			map=FileUtil.upload(request,ctx.getRealPath("/images"),user.getNickname());
			 printWriter = response.getWriter();
			String str=projectPath+map.get("changeImg");
			System.out.println(str);
			if("T".equals(map.get("succese"))){
			printWriter.println( "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + sFunc + ",' "+str+ "', '완료');</script>");
			}else{
				printWriter.println( "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + sFunc + ",' ', '실패');</script>");
			}
			printWriter.flush();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(printWriter!=null){
				try{printWriter.close();}catch(Exception e){e.printStackTrace();}
			}
		}
		return;
	}

	@RequestMapping("uploadProfile")
	public @ResponseBody String  uploadUser(HttpServletRequest request,
			HttpSession session) throws Exception {
		String projectPath="http:/"+java.net.InetAddress.getLocalHost().getHostAddress()+":"+request.getServerPort()+"/rcipe/images/";
		// 여기에 회원 별로 관리할수 있는 부분
//		User user=(User)session.getAttribute("user");
		User user=new User("user01","user01@naver.com","1111","!!!!");
		// File("c:\\fileUploadTest\\user"+user.getNickname"+"\\profile");
		File newFile=new File(ctx.getRealPath("/images")+"/"+user.getNickname());
		if(!newFile.isDirectory()){
			newFile.mkdirs();
		}
		System.out.println("\t\t\t\t\t\t"+ctx.getRealPath("/images")+"/"+user.getNickname());
		Map< String, String> map=FileUtil.upload(request,ctx.getRealPath("/images"),user.getNickname());
		fileService.deleteProfile(user.getNickname(),ctx.getRealPath("/images")) ;
		user.setUserImage(projectPath+map.get("changeImg"));
		fileService.updateProfile(user);
		//업로드 된 파일 위치를 출력
		String str=URLEncoder.encode(map+"", "UTF-8");
		return str;
	}

	@RequestMapping("deleteProfile")
	public @ResponseBody String deleteUser(HttpSession session)throws Exception {
//		User user=(User)session.getAttribute("user");
		User user=new User("user01","user01@naver.com","1111","!!!!");
		return URLEncoder.encode((fileService.deleteProfile(user.getNickname(),ctx.getRealPath("/images")) == true ?  "성공적으로 삭제했습니다":"삭제에 실패했습니다."),"UTF-8");
	}
}
