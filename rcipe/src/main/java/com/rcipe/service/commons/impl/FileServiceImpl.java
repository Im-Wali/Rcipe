package com.rcipe.service.commons.impl;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.commons.FileUtil;
import com.rcipe.service.commons.FileService;
import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;

@Service("fileServiceImpl")
public class FileServiceImpl implements FileService {

	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;

	@Autowired
	private ServletContext ctx;

	public FileServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean updateProfile(User user) throws Exception {
		// FileUtil.deleteFile(userService.getImge);
		return userService.updateImage(user);
	}

	@Override
	public boolean deleteProfile(String nickname, String path) throws Exception {
		// TODO Auto-generated method stub
		return FileUtil.deleteFile(path + "/"
				+ userService.getUserImage(nickname));
	}

	@Override
	public boolean deleteRecipeImages(String path) throws Exception {
		return FileUtil.deleteFile(ctx.getRealPath("/images") + "/"+path);
	}

	@Override
	public boolean deleteModifyPicture(String deletePicturePaths)
			throws Exception {
		String paths[] = deletePicturePaths.split(",");
		for (int i = 0; i < paths.length; i++) {
			System.out.println(i + "deleleteFile==" + paths[i]);
			if (!",".equals(paths[i])) {
				if (FileUtil.deleteFile(ctx.getRealPath("/images") + "/"
						+ paths[i]) == false)
					return false;
			}
		}
		return true;
	}

}
