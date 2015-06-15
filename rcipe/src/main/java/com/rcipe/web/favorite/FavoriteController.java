package com.rcipe.web.favorite;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rcipe.commons.Search;
import com.rcipe.service.detailRecipe.DetailRecipeService;
import com.rcipe.service.domain.Favorite;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.domain.User;
import com.rcipe.service.favorite.FavoriteService;
import com.rcipe.service.recipe.RecipeService;

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
	public ModelAndView getFavoriteList(@ModelAttribute("favorite") Favorite favorite,
			@ModelAttribute("search") Search search,
			HttpSession session) throws Exception {
		
		System.out.println("start getfavoriteList");
		
		//favorite.setNickname(((User)session.getAttribute("user")).getNickname());
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("nickname", ((User)session.getAttribute("user")).getNickname());
		map1.put("search", search);
		
		Map<String, Object> map2 = favoriteService.getFavoriteList(map1);
		
		System.out.println("totalCount : "+ map2.get("totalCount") + "list : " + map2.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:../../favorite/favorite.jsp");
		modelAndView.addObject("list", map2.get("list"));
		System.out.println(modelAndView);
		return modelAndView;
		
		
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
