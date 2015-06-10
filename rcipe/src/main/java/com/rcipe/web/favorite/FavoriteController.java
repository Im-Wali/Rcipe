package com.rcipe.web.favorite;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;
import com.rcipe.service.domain.User;
import com.rcipe.service.favorite.FavoriteService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {

	@Autowired
	@Qualifier("favoriteServiceImpl")
	FavoriteService favoriteService;

	public FavoriteController() {
		// TODO Auto-generated constructor stub
		System.out.println(getClass() + "start......");
	}

	@RequestMapping(value = "/insertFavorite", method = RequestMethod.GET)
	public void insertFavorite(@ModelAttribute("favorite") Favorite favorite,
			HttpSession session, ServletResponse response) throws Exception {
		
		response.setContentType("text/plain;charset=UTF-8");

		String tempfavoriteTitle = URLEncoder.encode(favorite.getFavorTitle() , "UTF-8");
		favorite.setFavorTitle(tempfavoriteTitle);
		System.out.println(tempfavoriteTitle);
		
		User user = (User) session.getAttribute("user");
		
		favorite.setNickname(user.getNickname());
		
		favoriteService.insertFavorite(favorite);
		
	}

}
