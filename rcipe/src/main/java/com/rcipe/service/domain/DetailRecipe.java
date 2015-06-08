package com.rcipe.service.domain;

public class DetailRecipe {

	/*
	 * recipeOrder Integer detailImage String detailContents String
	 */
	private Integer detailRecipeNo;
	private Integer recipeNo;
	private Integer recipeOrder;
	private String detailImage;
	private String detailContents;

	public DetailRecipe() {
		// TODO Auto-generated constructor stub
	}

	public DetailRecipe( Integer recipeNo,
			Integer recipeOrder, String detailImage, String detailContents) {
		super();
		this.recipeNo = recipeNo;
		this.recipeOrder = recipeOrder;
		this.detailImage = detailImage;
		this.detailContents = detailContents;
	}

	public Integer getDetailRecipeNo() {
		return detailRecipeNo;
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

	public void setDetailRecipeNo(Integer detailRecipeNo) {
		this.detailRecipeNo = detailRecipeNo;
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
		return "DetailRecipe [detailRecipeNo=" + detailRecipeNo + ", recipeNo="
				+ recipeNo + ", recipeOrder=" + recipeOrder + ", detailImage="
				+ detailImage + ", detailContents=" + detailContents + "]";
	}

}
