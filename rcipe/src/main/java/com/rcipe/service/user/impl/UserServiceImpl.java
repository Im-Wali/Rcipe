package com.rcipe.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.domain.User;
import com.rcipe.service.user.UserService;
import com.rcipe.service.user.UserDAO;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;

	public UserServiceImpl() {
		System.out.println("UserServiceImpl default Constractor......");
	}

	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public boolean insertUser(User user) throws Exception {
		return userDAO.insertUser(user) == 1 ? true : false;
	}

	@Override
	public boolean checkedEmail(String email) throws Exception {
		return userDAO.checkedEmail(email) == null ? true : false;
	}

	@Override
	public boolean checkedNickname(String nickname) throws Exception {
		return userDAO.checkedNickname(nickname) == null ? true : false;
	}

	@Override
	public User checkedLogin(User user) throws Exception {
		return userDAO.checkedLogin(user) ;
	}
	@Override
	public User getUser(String email) throws Exception {
		return userDAO.getUser(email);
	}
	
	@Override
	public boolean updatePassword(User user) throws Exception {
		return userDAO.updatePassword(user) == 1 ? true : false;
	}

	@Override
	public boolean updateImage(User user) throws Exception {
		return userDAO.updateImage(user) == 1 ? true : false;
	}
	
	@Override
	public String getUserImage(String nickname) throws Exception {
		return userDAO.getUserImage(nickname);
	}

	@Override
	public boolean deleteUser(String nickname) throws Exception {
		return userDAO.deleteUser(nickname) == 1 ? true : false;
	}
	
}
