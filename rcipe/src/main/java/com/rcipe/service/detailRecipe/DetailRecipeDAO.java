package com.rcipe.service.detailRecipe;

import java.util.List;

import com.rcipe.service.domain.DetailRecipe;

public interface DetailRecipeDAO {
	
	public boolean insertDetailRecipe(List<DetailRecipe> list) throws Exception;
	
	public List<DetailRecipe> getDetailRecipeList(int recipeNo)throws Exception;
	
	public int deleteDetailRecipe(int recipeNo)throws Exception;
}
