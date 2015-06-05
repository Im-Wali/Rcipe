package com.rcipe.service.domain;

public class RecipeDetail {

	/*
	 	recipeOrder		Integer
		detailImage		String
		detailContents	String
	 */
	private Integer reciepDetailNo;
	private Integer recipeNo;
	private Integer recipeOrder;
	private String detailImage;
	private String detailContents;
	
	public RecipeDetail() {
		// TODO Auto-generated constructor stub
	}

	public RecipeDetail(Integer recipeNo, Integer recipeOrder,
			String detailImage, String detailContents) {
		super();
		this.recipeNo = recipeNo;
		this.recipeOrder = recipeOrder;
		this.detailImage = detailImage;
		this.detailContents = detailContents;
	}

	public Integer getReciepDetailNo() {
		return reciepDetailNo;
	}

	public Integer getRecipeNo() {
		return recipeNo;
	}

	public Integer getRecipeOrder() {
		return recipeOrder;
	}

	public String getDetailImage() {
		return detailImage;
	}

	public String getDetailContents() {
		return detailContents;
	}

	public void setReciepDetailNo(Integer reciepDetailNo) {
		this.reciepDetailNo = reciepDetailNo;
	}

	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}

	public void setRecipeOrder(Integer recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}

	public void setDetailContents(String detailContents) {
		this.detailContents = detailContents;
	}

	@Override
	public String toString() {
		return "RecipeDetail [reciepDetailNo=" + reciepDetailNo + ", recipeNo="
				+ recipeNo + ", recipeOrder=" + recipeOrder + ", detailImage="
				+ detailImage + ", detailContents=" + detailContents + "]";
	}

	
}
