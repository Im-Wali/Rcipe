package com.rcipe.service.favorite.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

}
