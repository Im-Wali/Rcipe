package com.rcipe.service.domain;

import java.util.Date;

public class Favorite {

	/*
	 * recipe Recipe favoriteTitle String favoriteDate Date
	 */

	private Integer recipeNo;
	private String nickname;
	private String favorTitle;
	private Date favorDate;
	private Recipe recipe;
	private Integer starCnt;
	private Integer cmtCnt;

	public Favorite() {

	}

	public Favorite(Integer recipeNo, String nickname, String favorTitle,
			Date favorDate, Recipe recipe, Integer starCnt, Integer cmtCnt) {
		super();
		this.recipeNo = recipeNo;
		this.nickname = nickname;
		this.favorTitle = favorTitle;
		this.favorDate = favorDate;
		this.recipe = recipe;
		this.starCnt = starCnt;
		this.cmtCnt = cmtCnt;
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

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public Integer getStarCnt() {
		return starCnt;
	}

	public void setStarCnt(Integer starCnt) {
		this.starCnt = starCnt;
	}

	public Integer getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(Integer cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	@Override
	public String toString() {
		return "Favorite [recipeNo=" + recipeNo + ", nickname=" + nickname
				+ ", favorTitle=" + favorTitle + ", favorDate=" + favorDate
				+ ", recipe=" + recipe + ", starCnt=" + starCnt + ", cmtCnt="
				+ cmtCnt + "]";
	}

}
