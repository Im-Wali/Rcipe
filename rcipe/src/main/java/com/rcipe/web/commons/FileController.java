package com.rcipe.web.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
//	@RequestMapping("upload")
//	public @ResponseBody String upload(HttpServletRequest request)
//			throws IOException {
//		if (!(request instanceof MultipartHttpServletRequest)) {
//			return "형식과 맞지않습니다.";
//		}
//		// 회원 정보를 저자하는 부분
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//		File newFile = new File("c:\\fileUploadTest");
//		if (!newFile.isDirectory()) {
//			newFile.mkdir();
//		}
//
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//		for (String fileName : multipartRequest.getFileMap().keySet()) {
//			for (MultipartFile file : multipartRequest.getFiles(fileName)) {
//				String originalFileName = file.getOriginalFilename();
//
//				// 이부분을 회원마다 폴더구조를 정해서 관리할 예정이다.
//				// File newFile = new
//				// File("c:\\fileUploadTest"+user.getNickname());
//				System.out.println(request.getParameter("picture"));
//				// 파일의 확장자를 가지고 온다.
//				String imgExt = originalFileName.substring(
//						originalFileName.lastIndexOf(".") + 1,
//						originalFileName.length());
//				if (imgExt.toUpperCase().equalsIgnoreCase("JPG")) {
//					// 파일의 크기를 byte크기로 가지고 와서 버퍼크기로 지정한다.
//					byte[] bytes = file.getBytes();
//					FileOutputStream fileoutputStream = null;
//					try {
//						// 해당 위치에 파일을 생성하고
//						File outFileName = new File(newFile.getPath() + "\\"
//								+ originalFileName);
//						// 해당파일에 fileoutputstream을 통해서 파일을 복사한다.
//						fileoutputStream = new FileOutputStream(outFileName);
//						fileoutputStream.write(bytes);
//					} catch (IOException ie) {
//						System.err.println("File writing error! ");
//					} finally {
//						try {
//							fileoutputStream.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//					System.err.println("File upload success! ");
//				} else {
//					System.err.println("File type error!  FileType:" + imgExt);
//					return "해당 파일형식은 지원하지않습니다.";
//				}
//			}
//		}
//		return "success";
//	}

	@RequestMapping("uploadProfile")
	public ResponseEntity<Map<String, String>> uploadUser(HttpServletRequest request,
			HttpSession session) throws Exception {
		System.out.println("USEURESURUERUEUR");
		// 여기에 회원 별로 관리할수 있는 부분
//		User user=(User)session.getAttribute("user");
		User user=new User("user01","user01@naver.com","1111","!!!!");
		// File("c:\\fileUploadTest\\user"+user.getNickname"+"\\profile");
		File newFile = new File("c:\\fileUploadTest\\user\\profile");
		if (!newFile.isDirectory()) {
			newFile.mkdirs();
		}
		Map< String, String> map=FileUtil.upload(request, newFile);
		fileService.deleteProfile(user.getNickname()) ;
		user.setUserImage(map.get("chageImg"));
		fileService.updateProfile(user);
		//업로드 된 파일 위치를 출력
		HttpHeaders header=new HttpHeaders();
		header.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<Map <String,String>>(map,header,HttpStatus.OK);
	}

	@RequestMapping("deleteProfile")
	public @ResponseBody String deleteUser(HttpSession session)throws Exception {
		User user=(User)session.getAttribute("user");
		return (fileService.deleteProfile(user.getNickname()) == true ?  "성공적으로 삭제했습니다":"삭제에 실패했습니다.");
	}
}
