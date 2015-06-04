package com.rcipe.service.domain;

public class Ingredient {

	private String ingredientName;
	private Integer ingredientNo;
	private Integer recipeNo;

	public Ingredient() {
	}

	public Ingredient(Integer ingredientNo, Integer recipeNo) {
		super();
		this.ingredientNo = ingredientNo;
		this.recipeNo = recipeNo;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public Integer getIngredientNo() {
		return ingredientNo;
	}

	public Integer getRecipeNo() {
		return recipeNo;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public void setIngredientNo(Integer ingredientNo) {
		this.ingredientNo = ingredientNo;
	}

	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}

	@Override
	public String toString() {
		return "Ingredient [ingredientName=" + ingredientName
				+ ", ingredientNo=" + ingredientNo + ", recipeNo=" + recipeNo
				+ "]";
	}

}
