package com.rcipe.service.recipe;

import java.util.List;
import java.util.Map;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;

public interface RecipeService {
	
	public List<Ingredient> getIngredientList(String keyword)throws Exception;
	
	public boolean insertIngredient(String ingredientName)throws Exception;
	
	public Recipe insertRecipe(Recipe recipe)throws Exception;
	
	public int updateRecipe(Recipe recipe)throws Exception;
	
	public String insertStar(Recipe recipe)throws Exception;
	
	public Recipe getStar(Recipe recipe)throws Exception;
	
	public boolean insertRcpIng(List<Ingredient> list)throws Exception;
	
	public boolean deleteRecipe(int recipeNo) throws Exception;

	public Recipe getRecipe(int recipeNo) throws Exception;

	public boolean deleteRcpIng(int recipeNo) throws Exception;

	public Map<String, Object> getRecipeList(Search search) throws Exception;

}
