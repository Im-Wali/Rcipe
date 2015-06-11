package com.rcipe.service.recipe;

import java.util.List;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;

public interface RecipeDAO {

	public List<Ingredient> getIngredientList(String keyword) throws Exception;

	public boolean insertIngredient(String ingredientName) throws Exception;

	public Recipe insertRecipe(Recipe recipe) throws Exception;
	
	public int updateRecipe(Recipe recipe)throws Exception;

	public boolean insertRcpIng(List<Ingredient> list) throws Exception;
	
	public String insertStar(Recipe recipe)throws Exception;
	
	public Recipe getStar(Recipe recipe)throws Exception;

	public int deleteRecipe(int recipeNo) throws Exception;

	public Recipe getRecipe(int recipeNo) throws Exception;

	public int deleteRcpIng(int recipeNo) throws Exception;

	public List<Recipe> getRecipeList(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
	public int updateRecipeCount(int recipeNo)throws Exception;

	public List<Recipe> getRecipeListIngredients(List<String> searchIngredients) throws Exception;


}
