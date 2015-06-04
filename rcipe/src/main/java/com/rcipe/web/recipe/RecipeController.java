package com.rcipe.web.recipe;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.domain.RecipeDetail;
import com.rcipe.service.recipe.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	@Qualifier("recipeServiceImpl")
	RecipeService recipeService;

	public RecipeController() {
		System.out.println(getClass() + "start......");
	}

	@RequestMapping(value = "/insertRecipe", method = RequestMethod.POST)
	public String inserBoard(Model model, HttpServletRequest request,
			Recipe recipe,
			@RequestParam("detailCount") int detailCount,
			@RequestParam("detailNumber") int detailNumber,
			@RequestParam("ingredientIds") String ingredientIds,HttpSession session)
			throws Exception {
		System.out.println("detailCount = " + detailCount);
		System.out.println("detailNumber = " + detailNumber);
		System.out.println("ingnredientIds = "+ingredientIds);
		System.out.println(recipe);
		int detailNo=0;
		List<RecipeDetail> list=new ArrayList<RecipeDetail>();
		int count=0;
		for (int n = 1; n <= detailNumber; n++) {
			String image=request.getParameter("detailImage" + n);
			String content=request.getParameter("detailContents" + n);
			if(count==detailCount){
				break;
			}else if(image!=null){
				list.add(new RecipeDetail(detailNo,image,content));
			}
			System.out.println(n + "detailImage="
					+ image);
			System.out.println(n + "detailContents="
					+ content);
		}
		for(int i=0;i<list.size();i++){
			System.out.println("list== "+i+"="+list.get(i));
		}
		return "forward:/recipe/inserRecipe.jsp";
	}

	
	@RequestMapping(value = "/getIngredientList", method = RequestMethod.POST)
	public ResponseEntity<String> getIngredientList(@RequestParam("keyword") String keyword) throws Exception {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("list", recipeService.getIngredientList(keyword));
		String jsonString = new Gson().toJson(map);
		System.out.println("jsonString : " + jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	@RequestMapping(value = "/insertIngredient", method = RequestMethod.POST)
	public @ResponseBody String insertIngredient(@RequestParam("ingredientName") String ingredientName) throws Exception {
		return ""+recipeService.insertIngredient(ingredientName);
	}
	
	@RequestMapping(value = "/getRecipeList")
	public ModelAndView getRecipeList(@ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("getRecipeList start");
		
		Map<String , Object> map=recipeService.getRecipeList(search);
		
		System.out.println("totalCount : "+map.get("totalCount")+" list : "+map.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(search.getSearchKeyword()==null || search.getSearchKeyword()=="" ){
			modelAndView.setViewName("forward:../../main/mainPage.jsp");
		}else{
			modelAndView.setViewName("forward:../../main/searchResult.jsp");
		}
		modelAndView.addObject("list", map.get("list"));
		System.out.println(modelAndView);
		return modelAndView;
		
	}
}
