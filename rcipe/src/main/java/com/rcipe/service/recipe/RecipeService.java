package com.rcipe.service.recipe;

import com.rcipe.service.domain.Recipe;


public interface RecipeService {

	public boolean deleteRecipe(int rcp_no) throws Exception;

	public Recipe getRecipe(int rcp_no) throws Exception;

	public boolean deleteRcpIng(int rcp_no) throws Exception;
	
}
