package com.rcipe.service.domain;

import java.util.Date;
import java.util.List;

public class Board {

	/*
	 	boardNo			Integer
		nickname		String
		boardTitle		String
		boardContents	String
		boardCategory	Integer
		boardDate		Date
		boardCount		Integer
		commentList		List
		boardImage		List
	 */
	
	private Integer boardNo;
	private String nickname;
	private String boardTitle;
	private String boardContent;
	private Integer boardCategory;
	private String boardDate;
	private Integer boardCount;
	private String boardImgPath;
	private List commentList;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	

	public Board(Integer boardNo, String nickname, String boardTitle,
			String boardContent, Integer boardCategory, String boardDate,
			Integer boardCount, String boardImgPath, List commentList) {
		super();
		this.boardNo = boardNo;
		this.nickname = nickname;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardCategory = boardCategory;
		this.boardDate = boardDate;
		this.boardCount = boardCount;
		this.boardImgPath = boardImgPath;
		this.commentList = commentList;
	}


	public String getBoardImgPath() {
		return boardImgPath;
	}

	public void setBoardImgPath(String boardImgPath) {
		this.boardImgPath = boardImgPath;
	}

	public Integer getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nicname) {
		this.nickname = nicname;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Integer getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(Integer boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	
	public Integer getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(Integer boardCount) {
		this.boardCount = boardCount;
	}
	
	public List getCommentList() {
		return commentList;
	}

	public void setCommentList(List commentList) {
		this.commentList = commentList;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", nickname=" + nickname
				+ ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardCategory=" + boardCategory
				+ ", boardDate=" + boardDate +", boardCount=" +boardCount
				+ ", commentList=" + commentList  
				+", toString()="+ super.toString() + "]";
	}

}
