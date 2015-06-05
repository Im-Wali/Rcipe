package com.rcipe.service.recipe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.domain.RecipeDetail;
import com.rcipe.service.recipe.RecipeDAO;
import com.rcipe.service.recipe.RecipeService;

@Service("recipeServiceImpl")
public class RecipeServiceImpl  implements RecipeService{

	@Autowired
	@Qualifier("recipeDAOImpl")
	private RecipeDAO recipeDAO;
	
	public RecipeServiceImpl() {
		System.out.println(getClass()+"start......");
	}

	@Override
	public List<Ingredient> getIngredientList(String keyword) throws Exception {
		return recipeDAO.getIngredientList(keyword);
	}

	@Override
	public boolean insertIngredient(String ingredientName) throws Exception {
		return recipeDAO.insertIngredient(ingredientName);
	}

	@Override
	public Recipe insertRecipe(Recipe recipe) throws Exception {
		return recipeDAO.insertRecipe(recipe);
	}

	@Override
	public boolean insertRcpIng(List<Ingredient> list) throws Exception {
		return recipeDAO.insertRcpIng(list);
	}

	@Override
	public boolean insertRecipeDetail(List<RecipeDetail> list) throws Exception {
		return recipeDAO.insertRecipeDetail(list);
	}

}
