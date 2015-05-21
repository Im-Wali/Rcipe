package com.rcipe.service.board;

import java.util.List;

import com.rcipe.service.domain.Board;

	public interface BoardDAO {
	
		public void insertBoard(Board board) throws Exception;
		
		public Board getBoard(int boardNo) throws Exception;
		
		public void updateBoard(Board board) throws Exception;
		
		public int deleteBoard(int boardNo) throws Exception;
		
		public List<Board> getBoardList(Search search) throws Exception;
		
		public List<String> getBoardImgList(int boardNo) throws Exception;
		
		public int getTotalCount(Search search) throws Exception;

}
