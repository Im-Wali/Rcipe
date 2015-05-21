package com.rcipe.commons;


public class Search {
	
	///Field
	private int curruntPage;
	private String searchCategory;
	private String searchKeyword;
	private int pageSize;
	
	///Constructor
	public Search() {
	}
	
	public Search(int curruntPage, String searchCategory, String searchKeyword,
			int pageSize) {
		super();
		this.curruntPage = curruntPage;
		this.searchCategory = searchCategory;
		this.searchKeyword = searchKeyword;
		this.pageSize = pageSize;
	}

	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return curruntPage;
	}
	public void setCurrentPage(int curruntPage) {
		this.curruntPage = curruntPage;
	}

	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "Search [curruntPage=" + curruntPage + ", searchCategory="
				+ searchCategory + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + "]";
	}
}