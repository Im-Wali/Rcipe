package com.rcipe.service.recipe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.commons.Search;
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
	

	@Override
	public boolean deleteRecipe(int rcp_no) throws Exception {
		return recipeDAO.deleteRecipe(rcp_no) == 1 ? true : false;
	}

	@Override
	public Recipe getRecipe(int rcp_no) throws Exception {
		Recipe recipe=recipeDAO.getRecipe(rcp_no);
		return recipe;
	}

	@Override
	public boolean deleteRcpIng(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return recipeDAO.deleteRcpIng(rcp_no) == 1 ? false : true;
	}

	@Override
	public Map<String, Object> getRecipeList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Recipe> list = recipeDAO.getRecipeList(search);
		int totalCount = recipeDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
