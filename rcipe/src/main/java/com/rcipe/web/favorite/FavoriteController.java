package com.rcipe.web.favorite;

import java.net.URLDecoder;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			HttpSession session) throws Exception {
		
		System.out.println("start insertFavorite");
		
		String tempfavoriteTitle = URLDecoder.decode(favorite.getFavorTitle() , "UTF-8");
		favorite.setFavorTitle(tempfavoriteTitle);
		
		User user = (User) session.getAttribute("user");
		
		favorite.setNickname(user.getNickname());
		
		favoriteService.insertFavorite(favorite);
		
	}
	
	@RequestMapping(value = "/getfavoriteList", method = RequestMethod.GET)
	public void getfavoriteList(@ModelAttribute("favorite") Favorite favorite,
			HttpSession session) throws Exception {
		
		System.out.println("start getfavoriteList");
		
	}
	
	@RequestMapping(value = "/deletefavorite", method = RequestMethod.GET)
	public void deletefavorite(@ModelAttribute("favorite") Favorite favorite,
			HttpSession session) throws Exception {
		
		System.out.println("start deletefavorite");
		
		User user = (User) session.getAttribute("user");
		
		favorite.setNickname(user.getNickname());
		
		favoriteService.deleteFavorite(favorite);
		
	}

}
