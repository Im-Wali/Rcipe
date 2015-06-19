package com.rcipe.service.favorite;

import java.util.Map;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;

public interface FavoriteService {

	public boolean insertFavorite(Favorite favorite)throws Exception;

	public boolean deleteFavorite(Favorite favorite) throws Exception;
	
	public Map<String, Object> getFavoriteList(Search search) throws Exception;

	public int updateFavorite(Favorite favorite) throws Exception;

	public boolean selectFavorite(Favorite favorite) throws Exception;

}
