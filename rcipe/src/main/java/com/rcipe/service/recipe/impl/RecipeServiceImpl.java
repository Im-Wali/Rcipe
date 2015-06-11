package com.rcipe.service.recipe.impl;

import java.util.ArrayList;
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
	public Recipe getStar(Recipe recipe) throws Exception {
		return recipeDAO.getStar(recipe);
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
	public String insertStar(Recipe recipe) throws Exception {
		return recipeDAO.insertStar(recipe);
	}

	@Override
	public Recipe insertRecipe(Recipe recipe) throws Exception {
		return recipeDAO.insertRecipe(recipe);
	}

	@Override
	public int updateRecipe(Recipe recipe) throws Exception {
		return recipeDAO.updateRecipe(recipe);
	}

	@Override
	public boolean insertRcpIng(List<Ingredient> list) throws Exception {
		return recipeDAO.insertRcpIng(list);
	}


	@Override
	public boolean deleteRecipe(int recipeNo) throws Exception {
		commentServcie.deleteRecipeCmtList(recipeNo);
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
		
		String searchKeyword = search.getSearchKeyword();
		
		List<Recipe> list = null;
		
		if(searchKeyword==null){
			list = recipeDAO.getRecipeList(search);		// order by 없음. 
		}else{
			if(searchKeyword.contains(",")==true){
				String[] searchWordList = searchKeyword.split(",");
				List<String> searchIngredients = new ArrayList<String>();
				for(int i=0;i<searchWordList.length;i++){
					searchIngredients.add(searchWordList[i]);
				}
				list = recipeDAO.getRecipeListIngredients(searchIngredients);
			}else{
				list = recipeDAO.getRecipeList(search); // nickname,title 기준으로 가져오는 것
			}
		}
		
		
		// int totalCount = recipeDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", list.size());
		
		return map;
	}

}
