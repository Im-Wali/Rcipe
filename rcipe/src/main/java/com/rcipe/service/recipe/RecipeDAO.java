package com.rcipe.service.recipe;

import com.rcipe.service.domain.Recipe;


public interface RecipeDAO {

	public int deleteRecipe(int rcp_no) throws Exception;

	public Recipe getRecipe(int rcp_no) throws Exception;

	public int deleteRcpIng(int rcp_no) throws Exception;
	
}
