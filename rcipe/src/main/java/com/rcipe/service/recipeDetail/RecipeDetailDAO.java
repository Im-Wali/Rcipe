package com.rcipe.service.recipeDetail;

import java.util.List;

import com.rcipe.service.domain.RecipeDetail;

public interface RecipeDetailDAO {
	
	public List<RecipeDetail> getRecipeDetail(int rcp_no) throws Exception;

	public int deleteRecipeDetail(int rcp_no) throws Exception;
	
}
