package com.rcipe.service.favorite;

import com.rcipe.service.domain.Favorite;

public interface FavoriteService {

	public boolean insertFavorite(Favorite favorite)throws Exception;

	public boolean deleteFavorite(Favorite favorite) throws Exception;

}
