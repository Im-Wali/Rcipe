package com.rcipe.service.detailRecipeImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.service.detailRecipe.DetailRecipeDAO;
import com.rcipe.service.domain.DetailRecipe;

@Repository("detailRecipeDAOImpl")
public class DetailRecipeDAOImpl implements DetailRecipeDAO {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public DetailRecipeDAOImpl() {
		System.out.println(getClass() + "start......");
	}

	@Override
	public boolean insertDetailRecipe(List<DetailRecipe> list) throws Exception {
		for (int i = 0; i < list.size(); i++) {
			if (sqlSession.insert("DetailRecipeMapper.insertDetailRecipe",
					list.get(i)) != 1) {
				return false;
			}
		}
		return true;
	}

	@Override
	public List<DetailRecipe> getDetailRecipeList(int recipeNo) throws Exception {
		return sqlSession.selectList("DetailRecipeMapper.getDetailRecipeList",recipeNo);
	}
	

}
