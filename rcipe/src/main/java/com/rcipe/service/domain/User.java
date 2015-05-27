package com.rcipe.service.domain;

import java.util.Date;


import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;


class EncryptExample {

 // 암호화를 도와주는 녀석입니다.

 private static MessageDigest md; 

 

 // Singleton Pattern

 private static EncryptExample encryptExample = new EncryptExample();

 

 // 생성자

 EncryptExample() {

  try {

   // 들어갈 수 있는 값 MD2, MD5, SHA, SHA-1, SHA-256, SHA-384, SHA-512

   md = MessageDigest.getInstance("SHA-256");

  } catch (NoSuchAlgorithmException e) {

   e.printStackTrace();

  } 

 }

 

 // 암호화 메소드

 public static String encryptStr(String planText){

  // 암호화 도와주는 녀석에게 평문을 byte로 올립니다.

  md.update(planText.getBytes()); 

  

  // 암호화 방식에 맞게 변경하여 byte[] 로 돌려줍니다.

  byte byteData[] = md.digest();

 

  // byte를 string으로 바꾸는 작업을 합니다.

  StringBuffer sb = new StringBuffer(); 

  for(int i = 0 ; i < byteData.length ; i+=7){

   sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 1).substring(1));

  }

  

  // String return

  return sb.toString();

 }

}



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
		this.password = EncryptExample.encryptStr(password);
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
