package com.rcipe.service.domain;

public class RecipeDetail {

	/*
	 	recipeOrder		Integer
		detailImage		String
		detailContents	String
	 */
	
	private Integer recipeOrder;
	private String detailImage;
	private String detailContents;
	
	public RecipeDetail() {
		// TODO Auto-generated constructor stub
	}

	public Integer getRecipeOrder() {
		return recipeOrder;
	}

	public void setRecipeOrder(Integer recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public String getDetailImage() {
		return detailImage;
	}

	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}

	public String getDetailContents() {
		return detailContents;
	}

	public void setDetailContents(String detailContents) {
		this.detailContents = detailContents;
	}

	@Override
	public String toString() {
		return "RecipeDetail [recipeOrder=" + recipeOrder + ", detailImage="
				+ detailImage + ", detailContents=" + detailContents
				+ ", toString()=" + super.toString() + "]";
	}

	
	
}
