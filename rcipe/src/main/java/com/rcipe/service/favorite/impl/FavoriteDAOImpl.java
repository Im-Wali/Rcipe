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
		List<Integer> list = new ArrayList<Integer>();
		list = sqlSession.selectList("FavoriteMapper.getRecipeNumNickname", map.get("nickname"));
		System.err.println("유저가 갖고 있는 즐겨찾기의 레시피 넘버 : "+sqlSession.selectList("FavoriteMapper.getRecipeNumNickname", map.get("nickname")));
		List<Favorite> list1 = sqlSession.selectList("FavoriteMapper.getJoinFavorite", map.get("nickname"));
		System.err.println("유저가 갖고 있는 3개 조인 : "+sqlSession.selectList("FavoriteMapper.getJoinFavorite", map.get("nickname")));
		if(list.size()!=0){
			for(int i=0; i < list.size(); i++){
				System.err.println(sqlSession.selectOne("FavoriteMapper.getCommentCount", list.get(i)));
				list1.get(i).setCmtCnt((Integer) sqlSession.selectOne("FavoriteMapper.getCommentCount", list.get(i)));
			}
		}
		
		
		return list1;
	}

}
