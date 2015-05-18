package com.rcipe.service.domain;

import java.util.Date;

public class User {
/*
	nicname		String
	email		String
	password	String
	userImage	String
	joinDate	Date
*/
	
	private String nickname;
	private String email;
	private String password;
	private String userImage;
	private Date joinDate;
	private String flag;
	public User() {
	}
	
	public User(String nickname, String email, String password,
			String userImage) {
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.userImage = userImage;
	}
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getNickname() {
		return nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "User [nickname=" + nickname + ", email=" + email + ", password="
				+ password + ", userImage=" + userImage + ", joinDate="
				+ joinDate + ", toString()=" + super.toString() + "]";
	}

}
