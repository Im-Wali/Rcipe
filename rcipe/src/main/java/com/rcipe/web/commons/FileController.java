package com.rcipe.web.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rcipe.service.domain.User;

/*
 * 파일 업로드Test class 일단 file upload위치는 C:\\fileUploadTest폴더 밑으로 했고 일단 확장자가 JPG만 할수 있게 해놨다.
 */

@Controller
@RequestMapping("/file")
public class FileController {
	
	@RequestMapping("upload")
	public @ResponseBody String upload(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		if (!(request instanceof MultipartHttpServletRequest)) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST,
					"Expected multipart request");
			return null;
		}
		 //회원 정보를 저자하는 부분
		 HttpSession session=request.getSession();
		 User user=(User)session.getAttribute("user");
//		 if(user==null){
//		 return "login하고 이용해주세요";
//		 }
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		for (String fileName : multipartRequest.getFileMap().keySet()) {
			for (MultipartFile file : multipartRequest.getFiles(fileName)) {
				String originalFileName = file.getOriginalFilename();

				// 이부분을 회원마다 폴더구조를 정해서 관리할 예정이다.
//				File newFile = new File("c:\\fileUploadTest"+user.getNickname());
				File newFile = new File("c:\\fileUploadTest");
				if (!newFile.isDirectory()) {
					newFile.mkdir();
				}

				System.out.println(request.getParameter("picture"));
				// 파일의 확장자를 가지고 온다.
				String imgExt = originalFileName.substring(
						originalFileName.lastIndexOf(".") + 1,
						originalFileName.length());
				if (imgExt.toUpperCase().equalsIgnoreCase("JPG")) {
					// 파일의 크기를 byte크기로 가지고 와서 버퍼크기로 지정한다.
					byte[] bytes = file.getBytes();
					FileOutputStream fileoutputStream = null;
					try {
						// 해당 위치에 파일을 생성하고
						File outFileName = new File(newFile.getPath() + "\\"
								+ originalFileName);
						// 해당파일에 fileoutputstream을 통해서 파일을 복사한다.
						fileoutputStream = new FileOutputStream(outFileName);
						fileoutputStream.write(bytes);
					} catch (IOException ie) {
						System.err.println("File writing error! ");
					} finally {
						try {
							fileoutputStream.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					System.err.println("File upload success! ");
				} else {
					System.err.println("File type error!  FileType:" + imgExt);
					return "해당 파일형식은 지원하지않습니다.";
				}
			}
		}
		return "success";
	}
}
