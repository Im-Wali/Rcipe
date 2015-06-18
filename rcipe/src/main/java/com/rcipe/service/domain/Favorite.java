package com.rcipe.service.domain;

import java.util.Date;
import java.util.List;

public class Favorite {

	/*
	 * recipe Recipe favoriteTitle String favoriteDate Date
	 */

	private Integer recipeNo;
	private String nickname;
	private String favorTitle;
	private Date favorDate;
	private Recipe recipe;
	private Integer starAvg;
	private Integer cmtCnt;
	private Integer starCnt;

	public Favorite() {

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

	public Integer getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(Integer starAvg) {
		this.starAvg = starAvg;
	}

	public Integer getCmtCnt() {
		return cmtCnt;
	}

	public void setCmtCnt(Integer cmtCnt) {
		this.cmtCnt = cmtCnt;
	}

	public Integer getStarCnt() {
		return starCnt;
	}

	public void setStarCnt(Integer starCnt) {
		this.starCnt = starCnt;
	}



	@Override
	public String toString() {
		return "Favorite [recipeNo=" + recipeNo + ", nickname=" + nickname
				+ ", favorTitle=" + favorTitle + ", favorDate=" + favorDate
				+ ", recipe=" + recipe + ", starAvg=" + starAvg + ", cmtCnt="
				+ cmtCnt + ", starCnt=" + starCnt + "]";
	}
	
	
	
}
