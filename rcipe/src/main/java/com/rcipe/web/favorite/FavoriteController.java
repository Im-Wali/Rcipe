package com.rcipe.web.favorite;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.rcipe.commons.Search;
import com.rcipe.service.domain.Favorite;
import com.rcipe.service.domain.User;
import com.rcipe.service.favorite.FavoriteService;
import com.rcipe.web.recipe.RecipeController;

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
	public void insertFavorite(Model model,@ModelAttribute("favorite") Favorite favorite,
			HttpSession session) throws Exception {
		
		System.err.println("start insertFavorite");
		
		String tempfavoriteTitle = URLDecoder.decode(favorite.getFavorTitle() , "UTF-8");
		favorite.setFavorTitle(tempfavoriteTitle);
		
		User user = (User) session.getAttribute("user");
		
		favorite.setNickname(user.getNickname());
		
		// DB에 있나 확인하기
		String confirm = String.valueOf(favoriteService.selectFavorite(favorite));
		
		if(confirm.equals("true")){
			favoriteService.insertFavorite(favorite);	// insert 하는 부분	
		}
		
	}
	
	@RequestMapping(value = "/confirmFavorite", method = RequestMethod.GET)
	public @ResponseBody String confirmFavorite(@ModelAttribute("favorite") Favorite favorite,
			HttpSession session) throws Exception {
		
		System.err.println("start confirmFavorite");
		
		User user = (User) session.getAttribute("user");
		
		favorite.setNickname(user.getNickname());
		
		// DB에 있나 확인하기
		String confirm = String.valueOf(favoriteService.selectFavorite(favorite));
		
		return confirm;
		
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
	
	
	@RequestMapping(value = "/deleteFavorite", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFavorite(@ModelAttribute("favorite") Favorite favorite,
			@RequestParam("recipeNo") Integer recipeNo, @ModelAttribute("search") Search search,
			@RequestParam("nickname") String nickname, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("드루와라ㅠ start deleteFavorite");
		
		favorite.setNickname(nickname);
		favorite.setRecipeNo(recipeNo);
		
		favoriteService.deleteFavorite(favorite);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("nickname", ((User)session.getAttribute("user")).getNickname());
		map1.put("search", search);
		
		Map<String, Object> map2 = favoriteService.getFavoriteList(map1);
		map.put("list", map2.get("list"));
		map.put("totalCount", map2.get("totalCount"));
		
		String jsonString = new Gson().toJson(map);
		System.out.println("jsonString ㅊㅋ: "+jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateFavorite", method = RequestMethod.POST)
	public String updateFavorite(@ModelAttribute("favorite") Favorite favorite,
			 @ModelAttribute("search") Search search,HttpSession session
			) throws Exception {
		
		favorite.setNickname(((User)session.getAttribute("user")).getNickname());
		System.out.println(favorite);
		favoriteService.updateFavorite(favorite);
		return "redirect:getfavoriteList";
	}

}
