package com.rcipe.service.recipeDetail.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.service.domain.RecipeDetail;
import com.rcipe.service.recipeDetail.RecipeDetailDAO;

@Repository("recipeDetailDAOImpl")
public class RecipeDetailDAOImpl implements RecipeDetailDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public RecipeDetailDAOImpl() {
		System.out.println("RecipeDetailDAOImpl default Constractor......");
	}

	public RecipeDetailDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("RecipeDetailDAOImpl sqlSession Constractor......");
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Override
	public List<RecipeDetail> getRecipeDetail(int rcp_no) throws Exception {
		return sqlSession.selectList("RecipeDetailMapper.getRecipeDetail",
				rcp_no);
	}

	@Override
	public int deleteRecipeDetail(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("RecipeDetailMapper.deleteRecipeDetail", rcp_no);
	}

}
