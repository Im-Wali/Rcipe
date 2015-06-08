package com.rcipe.service.recipe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.commons.Search;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.recipe.RecipeDAO;
import com.rcipe.service.recipe.RecipeService;

@Service("recipeServiceImpl")
public class RecipeServiceImpl  implements RecipeService{

	@Autowired
	@Qualifier("recipeDAOImpl")
	private RecipeDAO recipeDAO;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentServcie;
	
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
	public boolean deleteRecipe(int recipeNo) throws Exception {
		return recipeDAO.deleteRecipe(recipeNo) == 1 ? true : false;
	}

	@Override
	public Recipe getRecipe(int recipeNo) throws Exception {
		Recipe recipe=recipeDAO.getRecipe(recipeNo);
		recipeDAO.updateRecipeCount(recipeNo);
		recipe.setCommentList(commentServcie.getRecipeCmtList(recipe.getRecipeNo()));
		return recipe;
	}

	@Override
	public boolean deleteRcpIng(int recipeNo) throws Exception {
		// TODO Auto-generated method stub
		return recipeDAO.deleteRcpIng(recipeNo) == 1 ? false : true;
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
