package com.rcipe.web.recipe;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rcipe.service.domain.Recipe;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	/*
	 * @Autowired
	 * 
	 * @Qualifier("recipeServiceImpl") RecipeService recipeService;
	 */

	public RecipeController() {
		System.out.println(getClass() + "start......");
	}

	@RequestMapping(value = "/inserRecipe", method = RequestMethod.POST)
	public String inserBoard(Model model, HttpServletRequest request,
			@ModelAttribute("recipe") Recipe recipe,
			@RequestParam("detailCount") int detailCount,
			@RequestParam("detailNumber") int detailNumber, HttpSession session)
			throws Exception {
		Enumeration<String> str = request.getParameterNames();
		int i = 1;
		while (str.hasMoreElements()) {
			System.out.println(i++ + " paramname: " + str.nextElement());
		}
		System.out.println("detailCount = "+detailCount);
		System.out.println("detailNumber = "+detailNumber);
		for(int n=1;n<=detailNumber;n++){
			System.out.println(n+"detailImage="+request.getParameter("detailImage"+n));
			System.out.println(n+"detailContents="+request.getParameter("detailContents"+n));
		}
		System.out.println(request.getParameter("detailImage2"));
		System.out.println(recipe);

		return "forward:/recipe/inserRecipe.jsp";
	}
}
