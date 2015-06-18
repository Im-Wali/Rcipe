package com.rcipe.service.favorite;

import java.util.List;
import java.util.Map;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;

public interface FavoriteDAO {

	public int insertFavorite(Favorite favorite)throws Exception;

	public int deleteFavorite(Favorite favorite)throws Exception;
	
	public List<Favorite> getFavoriteList(Map<String, Object> map) throws Exception;

	public int updateFavorite(Favorite favorite);

}
