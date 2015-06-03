package com.rcipe.service.recipe.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rcipe.commons.Search;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Comment;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.domain.User;
import com.rcipe.service.recipe.RecipeService;
import com.rcipe.service.recipeDetail.RecipeDetailService;

public class RecipeServiceTest {

	public RecipeServiceTest() {
		// TODO Auto-generated constructor stub
	}

	static public void main(String args[]) throws Exception {

		ApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "/config/*.xml" });

		RecipeService recipeService = (RecipeService) context
				.getBean("recipeServiceImpl");
		User user = new User("user01", "user01@naver.com", "1111", "!!!!");
		Recipe recipe = new Recipe(10000, user.getNickname(), "레시피 타이틀1",
				"이미지경로1", "레시피 내용1", "레시피팁1", 1, 2, "당근,양파", "20150601", 4, 3);
		CommentService commentService = (CommentService) context.getBean("commentServiceImpl");
		RecipeDetailService recipeDetailService = (RecipeDetailService) context
				.getBean("recipeDetailServiceImpl");
		Search search = new Search(1,"1","", 1);
		Comment comment = new Comment();
		comment.setCommentNo(10080);
		
		/*
		// getRecipe
		System.out.println("getRecipe Test 실행  : "+recipeService.getRecipe(recipe.getRecipeNo()));
		System.out.println("getRecipeCmtList Test 실행 : "+commentService.getRecipeCmtList(recipe.getRecipeNo()));
		System.out.println("getCommentReplyList Test 실행 : "+commentService.getCommentReplyList(comment.getCommentNo()));
		System.out.println("getRecipeDetail Test 실행 : "+recipeDetailService.getRecipeDetail(recipe.getRecipeNo()));
		// getRecipe
		*/
		
		// deleteRecipe 과정
		//System.out.println("delete Test 실행");
		// System.out.println("deleteRecipeCmtList Test 실행 : "+commentService.deleteRecipeCmtList(recipe.getRecipeNo()));
		// System.out.println("deleteRecipeDetail Test 실행 : "+recipeDetailService.deleteRecipeDetail(recipe.getRecipeNo()));
		//	System.out.println("deleteRcpIng Test 실행 : "+recipeService.deleteRcpIng(recipe.getRecipeNo()));
		// System.out.println(recipeService.deleteRecipe(recipe.getRecipeNo()));
		
		// getRecipeList
		System.out.println("getRecipeList Test 실행 : "+recipeService.getRecipeList(search));
		

	}

}
