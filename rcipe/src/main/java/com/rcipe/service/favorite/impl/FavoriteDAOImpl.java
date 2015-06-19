package com.rcipe.service.favorite.impl;

import java.util.ArrayList;
import java.util.HashMap;
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
	public Map<String,Object> getFavoriteList(Search search) throws Exception{
		List<Favorite> list=sqlSession.selectList("FavoriteMapper.getFavoriteList",search);
		if(list.size()!=0){
			for(int i=0; i < list.size(); i++){
				list.get(i).setCmtCnt(((Integer) sqlSession.selectOne("FavoriteMapper.getCommentCount", list.get(i).getRecipeNo())));
				list.get(i).setStarAvg(((Integer) sqlSession.selectOne("FavoriteMapper.getStarAvg", list.get(i).getRecipeNo())));
			}
		}
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", sqlSession.selectOne("FavoriteMapper.getTotalCount",search));
		return map;
	}

	@Override
	public int updateFavorite(Favorite favorite) {
		// TODO Auto-generated method stub
		return sqlSession.update("FavoriteMapper.updateFavorite", favorite);
	}

}
