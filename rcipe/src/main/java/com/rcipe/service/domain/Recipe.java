package com.rcipe.service.domain;

import java.util.Date;
import java.util.List;

public class Recipe {
	
	/*
	 	recipeNo		Integer
		nicname			String
		recipeTitle		String
		titleImage		String
		recipeContents	String
		tip				String
		recommend		Integer
		hit				Integer
		ingredients		String
		recipeDate		String
		star			Integer
		starHit			Integer
	 */
	
	private Integer recipeNo;
	private String nickname;
	private String recipeTitle;
	private String titleImage;
	private String recipeContents;
	private String tip;
	private Integer recommend;
	private Integer hit;
	private String ingredients;
	private String recipeDate;
	private Integer star;
	private Integer starHit;
	private List<DetailRecipe> detailRecipe;
	private List<Comment> commentList;
	public Recipe() {
		// TODO Auto-generated constructor stub
	}
	public Integer getRecipeNo() {
		return recipeNo;
	}
	public String getNickname() {
		return nickname;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public String getTitleImage() {
		return titleImage;
	}
	public String getRecipeContents() {
		return recipeContents;
	}
	public String getTip() {
		return tip;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public Integer getHit() {
		return hit;
	}
	public String getIngredients() {
		return ingredients;
	}
	public String getRecipeDate() {
		return recipeDate;
	}
	public Integer getStar() {
		return star;
	}
	public Integer getStarHit() {
		return starHit;
	}
	public List<DetailRecipe> getDetailRecipe() {
		return detailRecipe;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public void setRecipeContents(String recipeContents) {
		this.recipeContents = recipeContents;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public void setRecipeDate(String recipeDate) {
		this.recipeDate = recipeDate;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public void setStarHit(Integer starHit) {
		this.starHit = starHit;
	}
	public void setDetailRecipe(List<DetailRecipe> detailRecipe) {
		this.detailRecipe = detailRecipe;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", nickname=" + nickname
				+ ", recipeTitle=" + recipeTitle + ", titleImage=" + titleImage
				+ ", recipeContents=" + recipeContents + ", tip=" + tip
				+ ", recommend=" + recommend + ", hit=" + hit
				+ ", ingredients=" + ingredients + ", recipeDate=" + recipeDate
				+ ", star=" + star + ", starHit=" + starHit + ", detailRecipe="
				+ detailRecipe + ", commentList=" + commentList + "]";
	}




}
