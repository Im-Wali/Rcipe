package com.rcipe.web.recipe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
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
import com.rcipe.commons.Page;
import com.rcipe.commons.Search;
import com.rcipe.service.commons.FileService;
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

	@Autowired
	@Qualifier("fileServiceImpl")
	FileService fileService;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
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
		// 유저의 별점을 가지고온다.
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
		recipe.setNickname(((User) session.getAttribute("user")).getNickname());
		recipeService.insertRecipe(recipe);
		int recipeNo = recipe.getRecipeNo();
		int count = 0;
		List<DetailRecipe> list = new ArrayList<DetailRecipe>();
		List<Ingredient> ingredientList = new ArrayList<Ingredient>();
		String ingre[] = ingredientIds.trim().split("/");
		for (int k = 1; k < ingre.length; k++) {
			System.out.println(ingre[k]);
			ingredientList.add(new Ingredient(Integer.parseInt(ingre[k]),
					recipeNo));
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
		}
		detailRecipeService.insertDetailRecipe(list);
		recipeService.insertRcpIng(ingredientList);
		return "redirect:viewRecipe?recipeNo=" + recipeNo;
	}

	@RequestMapping(value = "/viewModifyRecipe", method = RequestMethod.GET)
	public String viewModifyRecipe(Model model,
			@RequestParam("recipeNo") int recipeNo) throws Exception {
		// 댓글도 같이 가지고오겠지만 그냥 상관없어서 그냥 함
		Recipe recipe = recipeService.getRecipe(recipeNo);
		recipe.setDetailRecipe(detailRecipeService.getDetailRecipeList(recipe
				.getRecipeNo()));
		model.addAttribute("recipe", recipe);
		System.out.println(recipe);
		return "recipe/modifyRecipe";
	}

	@RequestMapping(value = "/modifyRecipe", method = RequestMethod.POST)
	public String modifyRecipe(Model model, HttpServletRequest request,
			Recipe recipe, @RequestParam("detailCount") int detailCount,
			@RequestParam("detailNumber") int detailNumber,
			@RequestParam("deletePicturePaths") String deletePicturePaths,
			@RequestParam("ingredientIds") String ingredientIds,
			HttpSession session) throws Exception {
		recipeService.updateRecipe(recipe);
		int recipeNo = recipe.getRecipeNo();
		int count = 0;
		List<DetailRecipe> list =  new ArrayList<DetailRecipe>();
		// 레시피 사진들과 레시피을 일단 지운다.
		fileService.deleteModifyPicture(deletePicturePaths);
		//만약에 재로를 고치면 일단 이전에 있던 rcp_ing을 지우고 다시 insert한다.start.
		if (ingredientIds != null&&!"".equals(ingredientIds)) {
			recipeService.deleteRcpIng(recipeNo);
			List<Ingredient> ingredientList = new ArrayList<Ingredient>();
			String ingre[] = ingredientIds.trim().split("/");
			for (int k = 1; k < ingre.length; k++) {
				System.out.println(ingre[k]);
				ingredientList.add(new Ingredient(Integer.parseInt(ingre[k]),
						recipeNo));
			}
			recipeService.insertRcpIng(ingredientList);
		}
		//end
		
		//detailRecip로직 start.
		detailRecipeService.deleteDetailRecipe(recipeNo);
		for (int n = 1; n <= detailNumber; n++) {
			String image = request.getParameter("detailImage" + n);
			String content = request.getParameter("detailContents" + n);
			if (count == detailCount) {
				break;
			} else if (image != null) {
				count++;
				list.add(new DetailRecipe(recipeNo, count, image, content));
			}
		}
		detailRecipeService.insertDetailRecipe(list);
		//detailRecipe로직 End
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
			ServletResponse response,HttpServletRequest request) throws Exception {
		response.setContentType("text/plain;charset=UTF-8");
		System.out.println("getRecipeList start");
		System.out.println("search : " + search);
		ModelAndView modelAndView = new ModelAndView();
		if (search.getSearchKeyword() == null ) {
			modelAndView.setViewName("forward:../../main/mainPage.jsp");
		} else {
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			modelAndView.setViewName("forward:../../main/searchResult.jsp");
		}
		search.setPageSize(pageSize);
		Map<String, Object> map = recipeService.getRecipeList(search);
		if (search.getSearchKeyword() != null ) {
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			modelAndView.addObject("resultPage",resultPage);
			System.out.println("resultPage : "+resultPage);
		}
		modelAndView.addObject("search",search);
		modelAndView.addObject("list", map.get("list"));
		System.out.println(modelAndView);
		return modelAndView;

	}
	
	
	@RequestMapping(value = "/deleteRecipe", method = RequestMethod.GET)
	public void deleteRecipe(@RequestParam("recipeNo") int recipeNo, @RequestParam("imagePath") String imagePath,ServletResponse response) throws Exception {
		
		String[] iamgePathArray = imagePath.split("/");
		if(iamgePathArray.length >1){
			System.out.println(iamgePathArray[0]+"/"+iamgePathArray[1]);
			fileService.deleteRecipeImages(iamgePathArray[0]+"/"+iamgePathArray[1]);
		}
		recipeService.deleteRecipe(recipeNo);
		
		
	}

}
