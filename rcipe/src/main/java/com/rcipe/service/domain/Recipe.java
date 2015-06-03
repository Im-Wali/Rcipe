package com.rcipe.service.domain;


public class Recipe {
	
	/*
	 	recipeNo		Integer
		nicname			String
		recipeTitle		String
		titleImage		String
		recipeContents	String
		tip				String
		recommend		Integer
		hit				Integer
		ingredients		String
		recipeDate		Date
		star			Integer
		starHit			Integer
	 */
	
	private Integer recipeNo;
	private String nickname;
	private String recipeTitle;
	private String titleImage;
	private String recipeContents;
	private String tip;
	private Integer recommend;
	private Integer hit;
	private String ingredients;
	private String recipeDate;
	private Integer star;
	private Integer starHit;
	
	
	
	public Recipe(Integer recipeNo, String nickname, String recipeTitle,
			String titleImage, String recipeContents, String tip,
			Integer recommend, Integer hit, String ingredients,
			String recipeDate, Integer star, Integer starHit) {
		super();
		this.recipeNo = recipeNo;
		this.nickname = nickname;
		this.recipeTitle = recipeTitle;
		this.titleImage = titleImage;
		this.recipeContents = recipeContents;
		this.tip = tip;
		this.recommend = recommend;
		this.hit = hit;
		this.ingredients = ingredients;
		this.recipeDate = recipeDate;
		this.star = star;
		this.starHit = starHit;
	}

	public Recipe() {
		// TODO Auto-generated constructor stub
	}

	public Integer getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(Integer recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNicname(String nicname) {
		this.nickname = nicname;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getTitleImage() {
		return titleImage;
	}

	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}

	public String getRecipeContents() {
		return recipeContents;
	}

	public void setRecipeContents(String recipeContents) {
		this.recipeContents = recipeContents;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	public Integer getHit() {
		return hit;
	}

	public void setHit(Integer hit) {
		this.hit = hit;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getRecipeDate() {
		return recipeDate;
	}

	public void setRecipeDate(String recipeDate) {
		this.recipeDate = recipeDate;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public Integer getStarHit() {
		return starHit;
	}

	public void setStarHit(Integer starHit) {
		this.starHit = starHit;
	}

	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", nickname=" + nickname
				+ ", recipeTitle=" + recipeTitle + ", titleImage=" + titleImage
				+ ", recipeContents=" + recipeContents + ", tip=" + tip
				+ ", recommend=" + recommend + ", hit=" + hit
				+ ", ingredients=" + ingredients + ", recipeDate=" + recipeDate
				+ ", star=" + star + ", starHit=" + starHit + ", toString()="
				+ super.toString() + "]";
	}
}
