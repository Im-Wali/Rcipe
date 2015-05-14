package com.rcipe.service.domain;

import java.util.Date;

public class Favorite {

	/*
	 	recipe				Recipe
		favoriteTitle		String
		favoriteDate		Date
	 */
	
	private Recipe recipe;
	private String favoriteTitle;
	private Date favoriteDate;

	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public String getFavoriteTitle() {
		return favoriteTitle;
	}

	public void setFavoriteTitle(String favoriteTitle) {
		this.favoriteTitle = favoriteTitle;
	}

	public Date getFavoriteDate() {
		return favoriteDate;
	}

	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
	}

	@Override
	public String toString() {
		return "Favorite [recipe=" + recipe + ", favoriteTitle="
				+ favoriteTitle + ", favoriteDate=" + favoriteDate
				+ ", toString()=" + super.toString() + "]";
	}

}
