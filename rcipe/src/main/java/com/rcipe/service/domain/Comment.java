package com.rcipe.service.domain;

import java.util.Date;

public class Comment {

	/*
	 	commentNo			Integer
		commentReNo		Integer
		nicname					String
		commentContent	String
		commentDate		Date
		userImg			 		String
		contentNo 				 Integer 
	 */
	
	private Integer commentNo;
	private Integer commentReNo;
	private String nickname;
	private String commentContent;
	private Date commentDate;
	private String userImg;
	private Integer contentNo;
	

	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Integer getCommentNo() {
		return commentNo;
	}


	public Integer getCommentReNo() {
		return commentReNo;
	}


	public String getNickname() {
		return nickname;
	}


	public String getCommentContent() {
		return commentContent;
	}


	public Date getCommentDate() {
		return commentDate;
	}


	public String getUserImg() {
		return userImg;
	}


	public Integer getContentNo() {
		return contentNo;
	}


	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}


	public void setCommentReNo(Integer commentReNo) {
		this.commentReNo = commentReNo;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}


	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}


	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}


	public void setContentNo(Integer contentNo) {
		this.contentNo = contentNo;
	}


	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentReNo="
				+ commentReNo + ", nickname=" + nickname + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate
				+ ", toString()=" + super.toString() + "]";
	}

}
