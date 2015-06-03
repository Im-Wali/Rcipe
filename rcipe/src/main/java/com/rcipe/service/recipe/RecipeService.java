package com.rcipe.service.recipe;

import java.util.Map;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Recipe;


public interface RecipeService {

	public boolean deleteRecipe(int rcp_no) throws Exception;

	public Recipe getRecipe(int rcp_no) throws Exception;

	public boolean deleteRcpIng(int rcp_no) throws Exception;

	public Map<String, Object> getRecipeList(Search search) throws Exception;
	
}
