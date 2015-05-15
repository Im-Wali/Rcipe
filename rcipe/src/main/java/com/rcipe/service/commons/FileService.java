package com.rcipe.service.commons;

import com.rcipe.service.domain.User;

public interface FileService {
	public boolean updateProfile(User user) throws Exception;
	
	public boolean deleteProfile(String nickname)throws Exception;
}
