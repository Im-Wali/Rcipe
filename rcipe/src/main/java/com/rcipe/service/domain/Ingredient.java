package com.rcipe.service.domain;

public class Ingredient {

	private String ingredientName;
	private Integer ingredientNo;
	
	public Ingredient() {
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public Integer getIngredientNo() {
		return ingredientNo;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public void setIngredientNo(Integer ingredientNo) {
		this.ingredientNo = ingredientNo;
	}

	@Override
	public String toString() {
		return "Ingredient [ingredientName=" + ingredientName
				+ ", ingredientNo=" + ingredientNo + "]";
	}
	
}
