package com.rcipe.service.domain;

import java.util.Date;

public class Comment {

	/*
	 	commentNo		Integer
		commentReNo		Integer
		nicname			String
		commentContents	String
		commentDate		Date
	 */
	
	private Integer commentNo;
	private Integer commentReNo;
	private String nickname;
	private String commentContents;
	private Date commentDate;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Integer getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}

	public Integer getCommentReNo() {
		return commentReNo;
	}

	public void setCommentReNo(Integer commentReNo) {
		this.commentReNo = commentReNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNicname(String nicname) {
		this.nickname = nicname;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentReNo="
				+ commentReNo + ", nickname=" + nickname + ", commentContents="
				+ commentContents + ", commentDate=" + commentDate
				+ ", toString()=" + super.toString() + "]";
	}

}
