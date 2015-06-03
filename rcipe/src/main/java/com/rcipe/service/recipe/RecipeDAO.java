package com.rcipe.service.recipe;

import java.util.List;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Board;
import com.rcipe.service.domain.Recipe;


public interface RecipeDAO {

	public int deleteRecipe(int rcp_no) throws Exception;

	public Recipe getRecipe(int rcp_no) throws Exception;

	public int deleteRcpIng(int rcp_no) throws Exception;

	public List<Board> getRecipeList(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
}
