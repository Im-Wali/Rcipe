package com.rcipe.service.detailRecipeImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.detailRecipe.DetailRecipeDAO;
import com.rcipe.service.detailRecipe.DetailRecipeService;
import com.rcipe.service.domain.DetailRecipe;

@Service("detailRecipeServiceImpl")
public class DetailRecipeImpl implements DetailRecipeService {

	@Autowired
	@Qualifier("detailRecipeDAOImpl")
	private DetailRecipeDAO detailRecipeDAO;
	
	public DetailRecipeImpl() {
		System.out.println(getClass()+"start......");
	}

	@Override
	public boolean insertDetailRecipe(List<DetailRecipe> list) throws Exception {
		return detailRecipeDAO.insertDetailRecipe(list);
	}

	@Override
	public List<DetailRecipe> getDetailRecipeList(int recipeNo) throws Exception {
		// TODO Auto-generated method stub
		return detailRecipeDAO.getDetailRecipeList(recipeNo);
	}

}
