package com.rcipe.commons;


public class Search {
	
	///Field
	private int currentPage;
	private String searchCategory;
	private String searchKeyword;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	///Constructor
	public Search() {
	}
	
	public Search(int curruntPage, String searchCategory, String searchKeyword, int pageSize) {
		super();
		this.currentPage = currentPage;
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
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCategory="
				+ searchCategory + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", endRowNum=" + endRowNum
				+ ", startRowNum=" + startRowNum + "]";
	}

	
}