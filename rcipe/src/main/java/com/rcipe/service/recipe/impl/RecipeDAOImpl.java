package com.rcipe.service.recipe.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.recipe.RecipeDAO;

@Repository("recipeDAOImpl")
public class RecipeDAOImpl implements RecipeDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public RecipeDAOImpl() {
		System.out.println(getClass() + "start....");
	}

	@Override
	public Recipe getStar(Recipe recipe) throws Exception {
		return sqlSession.selectOne("RecipeMapper.selectStar", recipe);
	}

	@Override
	public List<Ingredient> getIngredientList(String keyword) throws Exception {
		return sqlSession.selectList("RecipeMapper.getIngredientList", keyword);
	}

	@Override
	public boolean insertIngredient(String ingredientName) throws Exception {
		String str = sqlSession.selectOne("RecipeMapper.getIngredient",
				ingredientName);
		if (str != null) {
			return false;
		}
		return sqlSession.insert("RecipeMapper.insertIngredient",
				ingredientName) == 1 ? true : false;
	}

	@Override
	public int updateRecipe(Recipe recipe) throws Exception {
		return sqlSession.update("RecipeMapper.updateRecipe",recipe);
	}

	@Override
	public String insertStar(Recipe recipe) throws Exception {
		if (sqlSession.update("RecipeMapper.updateStar", recipe) == 1) {
			return "별점을 " + recipe.getStar() + "개로 수정했습니다.";
		} else if (sqlSession.insert("RecipeMapper.insertStar", recipe) == 1) {
			return "별점을 " + recipe.getStar() + "개 주었습니다..";
		} else
			return "별점 주는중 비정상적으로 종료되었습니다";
	}

	@Override
	public Recipe insertRecipe(Recipe recipe) throws Exception {
		sqlSession.insert("RecipeMapper.insertRecipe", recipe);
		return recipe;
	}

	@Override
	public boolean insertRcpIng(List<Ingredient> list) throws Exception {
		for (int i = 0; i < list.size(); i++) {
			if (sqlSession.insert("RecipeMapper.insertRcpIng", list.get(i)) != 1) {
				return false;
			}
		}
		return true;
	}

	@Override
	public int deleteRecipe(int recipeNo) throws Exception {
		deleteRcpIng(recipeNo);
		sqlSession.delete("RecipeMapper.deleteDetailRcp", recipeNo);
		sqlSession.delete("RecipeMapper.deleteStars", recipeNo);
		return sqlSession.delete("RecipeMapper.deleteRecipe", recipeNo);

	}

	@Override
	public Recipe getRecipe(int recipeNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.getRecipe", recipeNo);
	}

	@Override
	public int deleteRcpIng(int recipeNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("RecipeMapper.deleteRcpIng", recipeNo);
	}

	@Override
	public List<Recipe> getRecipeList(Search search) throws Exception {
		// TODO Auto-generated method stub
		if (search.getSearchKeyword() == null) {
			return sqlSession.selectList("RecipeMapper.getDefalutRecipeList");
		} else {
			return sqlSession.selectList("RecipeMapper.getRecipeList", search);
		}
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.getTotalCount", search);
	}

	@Override
	public int updateRecipeCount(int recipeNo) throws Exception {
		return sqlSession.update("RecipeMapper.updateRecipeCount", recipeNo);
	}

	@Override
	public List<Recipe> getRecipeListIngredients(List<String> searchIngredients)
			throws Exception {
		List<Integer> list = sqlSession.selectList(
				"RecipeMapper.getIngredientsList", searchIngredients);
		List<Recipe> listRecipe = new ArrayList<Recipe>();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list 순서대로 " + list.get(i));
			listRecipe.add((Recipe) sqlSession.selectOne(
					"RecipeMapper.getRecipeListIngredients", list.get(i)));
		}
		return listRecipe;
	}

}
