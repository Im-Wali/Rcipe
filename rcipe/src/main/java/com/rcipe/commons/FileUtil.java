package com.rcipe.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rcipe.service.domain.User;

public class FileUtil {

	public FileUtil() {
		// TODO Auto-generated constructor stub
	}
	public static  String upload(HttpServletRequest request ,File newFile) throws IOException {
		if (!(request instanceof MultipartHttpServletRequest)) {
			return "형식과 맞지않습니다.";
		}
		 //회원 정보를 저자하는 부분
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		for (String fileName : multipartRequest.getFileMap().keySet()) {
			for (MultipartFile file : multipartRequest.getFiles(fileName)) {
				String originalFileName = file.getOriginalFilename();
				// 이부분을 회원마다 폴더구조를 정해서 관리할 예정이다.
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
