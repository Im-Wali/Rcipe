package com.rcipe.service.recipeDetail.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Board;
import com.rcipe.service.domain.RecipeDetail;
import com.rcipe.service.recipeDetail.RecipeDetailDAO;
import com.rcipe.service.recipeDetail.RecipeDetailService;


@Service("recipeDetailServiceImpl")
public class RecipeDetailServiceImpl implements RecipeDetailService{

	@Autowired
	@Qualifier("recipeDetailDAOImpl")
	private RecipeDetailDAO recipeDetailDAO;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentServcie;
	
	public RecipeDetailServiceImpl() {
		System.out.println("RecipeDetailServiceImpl default Constractor......");
	}

	@Override
	public List<RecipeDetail> getRecipeDetail(int rcp_no) throws Exception {
		List<RecipeDetail> list =recipeDetailDAO.getRecipeDetail(rcp_no);
		return list;
	}

	@Override
	public int deleteRecipeDetail(int rcp_no) throws Exception {
		commentServcie.deleteRecipeCmtList(rcp_no);
		return recipeDetailDAO.deleteRecipeDetail(rcp_no);
	}

}
