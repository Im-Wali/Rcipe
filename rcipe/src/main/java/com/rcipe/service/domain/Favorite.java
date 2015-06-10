package com.rcipe.service.domain;

import java.util.Date;

public class Favorite {

	/*
	 	recipe				Recipe
		favoriteTitle		String
		favoriteDate		Date
	 */
	
	private Integer recipeNo;
	private String nickname;
	private String favorTitle;
	private Date favorDate;

	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(Integer recipeNo, String nickname, String favorTitle,
			Date favorDate) {
		super();
		this.recipeNo = recipeNo;
		this.nickname = nickname;
		this.favorTitle = favorTitle;
		this.favorDate = favorDate;
	}

	public Integer getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFavorTitle() {
		return favorTitle;
	}

	public void setFavorTitle(String favorTitle) {
		this.favorTitle = favorTitle;
	}

	public Date getFavorDate() {
		return favorDate;
	}

	public void setFavorDate(Date favorDate) {
		this.favorDate = favorDate;
	}

	@Override
	public String toString() {
		return "Favorite [recipeNo=" + recipeNo + ", nickname=" + nickname
				+ ", favorTitle=" + favorTitle + ", favorDate=" + favorDate
				+ "]";
	}

	

}
