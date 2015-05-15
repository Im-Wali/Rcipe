package com.rcipe.service.user;

import com.rcipe.service.domain.User;

public interface UserService {
	public boolean insertUser(User user) throws Exception;

	public boolean checkedEmail(String email) throws Exception;

	public boolean checkedNickname(String nickname) throws Exception;

	public String checkedLogin(User user) throws Exception;

	public User getUser(String email) throws Exception;
	
	public boolean updatePassword(User user) throws Exception;

	public boolean updateImage(User user) throws Exception;

	public boolean deleteUser(String nickname) throws Exception;
	
	public boolean deleteImage(User user) throws Exception;
}
