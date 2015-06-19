package com.rcipe.web.favorite;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.rcipe.commons.Page;
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
	
	@Value("#{commonProperties['favoritePageSize']}")
	int pageSize;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
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
	
	/*@RequestMapping(value = "/getfavoriteList", method = RequestMethod.GET)
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
	}*/
	
	@RequestMapping(value = "/getfavoriteList", method = RequestMethod.GET)
	public ModelAndView getFavoriteList(@ModelAttribute("favorite") Favorite favorite,
			@ModelAttribute("search") Search search,
			HttpSession session) throws Exception {
		System.out.println("start getfavoriteList");
		System.out.println("search ="+search);
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchKeyword( ((User)session.getAttribute("user")).getNickname());
		Map<String, Object> map2 = favoriteService.getFavoriteList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
														((Integer) map2.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		
		System.out.println("resultPage : "+resultPage);
		System.out.println("list.size() ="+((List) map2.get("list")).size());
		System.out.println("totalCount : "+ map2.get("totalCount") + " list : " + map2.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:../../favorite/favorite.jsp");
		modelAndView.addObject("list", map2.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		System.out.println("modelAndView : "+modelAndView);
		return modelAndView;
		
		
	}
	
	
	@RequestMapping(value = "/deleteFavorite", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFavorite(@ModelAttribute("favorite") Favorite favorite,
			@RequestParam("recipeNo") Integer recipeNo, @ModelAttribute("search") Search search,
			@RequestParam("nickname") String nickname, HttpSession session) throws Exception {
		
		System.out.println("드루와라ㅠ start deleteFavorite");
		
		favorite.setNickname(nickname);
		favorite.setRecipeNo(recipeNo);
		
		favoriteService.deleteFavorite(favorite);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchKeyword( ((User)session.getAttribute("user")).getNickname());

		Map<String, Object> map2 = favoriteService.getFavoriteList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), 
				((Integer) map2.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", map2.get("list"));
		map.put("totalCount", map2.get("totalCount"));
		map.put("resultPage", resultPage);
		
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
