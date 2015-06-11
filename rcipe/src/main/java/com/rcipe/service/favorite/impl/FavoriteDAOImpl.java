package com.rcipe.service.favorite.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.favorite.FavoriteDAO;

@Repository("favoriteDAOImpl")
public class FavoriteDAOImpl implements FavoriteDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public FavoriteDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	public FavoriteDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("UserDAOImpl sqlSession Constractor......");
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Override
	public int insertFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("FavoriteMapper.insertFavorite",favorite);
	}

	@Override
	public int deleteFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("FavoriteMapper.deleteFavorite",favorite);
	}
	
	@Override
	public List<Favorite> getFavoriteList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
//				if (search.getSearchKeyword() == null) {
//					return sqlSession.selectList("RecipeMapper.getRecipeList", search);
/*				} else {
					List<Recipe> temp1, temp2, favoriteList = new ArrayList<Recipe>();
					if (sqlSession.selectOne("RecipeMapper.getCheckIngredient", search) != null) {
						List<String> listTemp = new ArrayList<String>();
						listTemp.add(search.getSearchKeyword());

						temp1 = sqlSession.selectList("RecipeMapper.getRecipeList",
								search);
						temp2 = getRecipeListIngredients(listTemp);

						for (int i = 0; i < temp1.size(); i++) {
							favoriteList.add(temp1.get(i));
						}
						for (int i = 0; i < temp1.size(); i++) {
							favoriteList.add(temp2.get(i));
						}

					}*/
		
		return sqlSession.selectList("FavoriteMapper.getFavoriteList", map);
	}

}
