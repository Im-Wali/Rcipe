package com.rcipe.service.favorite.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.service.domain.Favorite;
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

}
