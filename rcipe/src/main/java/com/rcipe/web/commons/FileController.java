package com.rcipe.web.commons;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rcipe.commons.FileUtil;
import com.rcipe.service.commons.FileService;
import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

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

	@RequestMapping("uploadProfile")
	public @ResponseBody String  uploadUser(HttpServletRequest request,
			HttpSession session) throws Exception {
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
		user.setUserImage(map.get("changeImg"));
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
