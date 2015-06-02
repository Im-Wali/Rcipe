package com.rcipe.service.recipe.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.recipe.RecipeDAO;
import com.rcipe.service.recipe.RecipeService;


@Service("recipeServiceImpl")
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	@Qualifier("recipeDAOImpl")
	private RecipeDAO recipeDAO;
	
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentServcie;
	
	public RecipeServiceImpl() {
		System.out.println("RecipeServiceImpl default Constractor......");
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

}
