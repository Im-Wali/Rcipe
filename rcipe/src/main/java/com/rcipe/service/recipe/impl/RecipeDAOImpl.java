package com.rcipe.service.recipe.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.service.domain.Recipe;
import com.rcipe.service.recipe.RecipeDAO;


@Repository("recipeDAOImpl")
public class RecipeDAOImpl implements RecipeDAO {

	@Autowired
	 @Qualifier("sqlSessionTemplate")
	 private  SqlSession sqlSession;
	
	public RecipeDAOImpl() {
		System.out.println("RecipeDAOImpl default Constractor......");
	}
	
	public RecipeDAOImpl(SqlSession sqlSession) {
		 this.sqlSession=sqlSession;
			System.out.println("RecipeDAOImpl sqlSession Constractor......");
		}
	 public SqlSession getSqlSession() {
			return sqlSession;
		}

	@Override
	public int deleteRecipe(int rcp_no) throws Exception {
		return sqlSession.update("RecipeMapper.deleteRecipe", rcp_no);
		
	}

	@Override
	public Recipe getRecipe(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.getRecipe", rcp_no);
	}

	@Override
	public int deleteRcpIng(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("RecipeMapper.deleteRcpIng", rcp_no);
	}

	
}
