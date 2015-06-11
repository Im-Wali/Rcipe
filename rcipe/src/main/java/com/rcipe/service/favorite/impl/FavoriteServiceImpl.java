package com.rcipe.service.favorite.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;
import com.rcipe.service.favorite.FavoriteDAO;
import com.rcipe.service.favorite.FavoriteService;


@Service("favoriteServiceImpl")
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	@Qualifier("favoriteDAOImpl")
	private FavoriteDAO favoriteDAO;
	
	public FavoriteServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean insertFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		return  favoriteDAO.insertFavorite(favorite) == 1 ? true : false;
	}

	@Override
	public boolean deleteFavorite(Favorite favorite) throws Exception {
		// TODO Auto-generated method stub
		return favoriteDAO.deleteFavorite(favorite) == 1 ? true : false;
	}
 
	@Override
	public Map<String, Object> getFavoriteList(Map<String, Object> map) throws Exception {
		
		List<Favorite> list = favoriteDAO.getFavoriteList(map);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("list", list);
		map1.put("totalCount", list.size());
		
		return map1;
		
		
		
	}
}
