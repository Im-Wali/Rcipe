package com.rcipe.web.recipe;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
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
import com.rcipe.service.detailRecipe.DetailRecipeService;
import com.rcipe.service.domain.DetailRecipe;
import com.rcipe.service.domain.Ingredient;
import com.rcipe.service.domain.Recipe;
import com.rcipe.service.domain.User;
import com.rcipe.service.recipe.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	@Qualifier("recipeServiceImpl")
	RecipeService recipeService;

	@Autowired
	@Qualifier("detailRecipeServiceImpl")
	DetailRecipeService detailRecipeService;

	public RecipeController() {
		System.out.println(getClass() + "start......");
	}

	@RequestMapping(value = "/viewRecipe", method = RequestMethod.GET)
	public String viewRecipe(Model model,
			@RequestParam("recipeNo") int recipeNo, HttpSession session)
			throws Exception {
		Recipe recipe = recipeService.getRecipe(recipeNo);
		recipe.setDetailRecipe(detailRecipeService.getDetailRecipeList(recipe
				.getRecipeNo()));
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Recipe starRecipe = new Recipe(recipe.getRecipeNo(),
					user.getNickname());
			starRecipe = recipeService.getStar(starRecipe);
			model.addAttribute("starRecipe", starRecipe);
		}
		model.addAttribute("recipe", recipe);
		model.addAttribute("content", 0);
		System.out.println(recipe);
		System.out.println(recipe.getDetailRecipe());
		return "recipe/recipe";
	}

	@RequestMapping(value = "/viewInsertRecipe", method = RequestMethod.GET)
	public String viewInsertRecipe() throws Exception {
		return "recipe/insertRecipe";
	}

	@RequestMapping(value = "/insertRecipe", method = RequestMethod.POST)
	public String insertRecipe(Model model, HttpServletRequest request,
			Recipe recipe, @RequestParam("detailCount") int detailCount,
			@RequestParam("detailNumber") int detailNumber,
			@RequestParam("ingredientIds") String ingredientIds,
			HttpSession session) throws Exception {
		System.out.println("detailCount = " + detailCount);
		System.out.println("detailNumber = " + detailNumber);
		System.out.println("ingnredientIds = " + ingredientIds);
		System.out.println(recipe);
		recipe.setNickname(((User) session.getAttribute("user")).getNickname());
		recipeService.insertRecipe(recipe);
		int recipeNo = recipe.getRecipeNo();
		int count = 0;
		List<DetailRecipe> list = new ArrayList<DetailRecipe>();
		List<Ingredient> ingredientList = new ArrayList<Ingredient>();
		String ingre[] = ingredientIds.trim().split("/");
		System.out.println(ingre);
		for (int k = 1; k < ingre.length; k++) {
			System.out.println(ingre[k]);
			ingredientList.add(new Ingredient(Integer.parseInt(ingre[k]),
					recipeNo));
		}
		for (int j = 0; j < ingredientList.size(); j++) {
			System.out.println("IngredientIds " + j + "="
					+ ingredientList.get(j));
		}
		for (int n = 1; n <= detailNumber; n++) {
			String image = request.getParameter("detailImage" + n);
			String content = request.getParameter("detailContents" + n);
			if (count == detailCount) {
				break;
			} else if (image != null) {
				count++;
				list.add(new DetailRecipe(recipeNo, count, image, content));
			}
			System.out.println(n + "detailImage=" + image);
			System.out.println(n + "detailContents=" + content);
		}
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list== " + i + "=" + list.get(i));
		}
		detailRecipeService.insertDetailRecipe(list);
		recipeService.insertRcpIng(ingredientList);
		return "redirect:viewRecipe?recipeNo=" + recipeNo;
	}

	@RequestMapping(value = "/insertStar", method = RequestMethod.POST)
	public ResponseEntity<String> insertStar(Recipe recipe) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("massage", recipeService.insertStar(recipe));
		String jsonString = new Gson().toJson(map);
		System.out.println("jsonString : " + jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/getIngredientList", method = RequestMethod.POST)
	public ResponseEntity<String> getIngredientList(
			@RequestParam("keyword") String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", recipeService.getIngredientList(keyword));
		String jsonString = new Gson().toJson(map);
		System.out.println("jsonString : " + jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}

	@RequestMapping(value = "/insertIngredient", method = RequestMethod.POST)
	public @ResponseBody String insertIngredient(
			@RequestParam("ingredientName") String ingredientName)
			throws Exception {
		return "" + recipeService.insertIngredient(ingredientName);
	}

	@RequestMapping(value = "/getRecipeList")
	public ModelAndView getRecipeList(@ModelAttribute("search") Search search,
			ServletResponse response) throws Exception {
		response.setContentType("text/plain;charset=UTF-8");
		System.out.println("getRecipeList start");
		System.out.println("search : " + search);

		Map<String, Object> map = recipeService.getRecipeList(search);

		System.out.println("totalCount : " + map.get("totalCount") + " list : "
				+ map.get("list"));

		ModelAndView modelAndView = new ModelAndView();

		if (search.getSearchKeyword() == null
				|| search.getSearchKeyword() == "") {
			modelAndView.setViewName("forward:../../main/mainPage.jsp");
		} else {
			modelAndView.setViewName("forward:../../main/searchResult.jsp");
		}
		modelAndView.addObject("list", map.get("list"));
		System.out.println(modelAndView);
		return modelAndView;

	}

}
