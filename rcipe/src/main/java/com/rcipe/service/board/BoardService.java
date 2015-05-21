package com.rcipe.service.board;

import java.util.Map;

import com.rcipe.service.domain.Board;

	public interface BoardService {

		public void insertBoard(Board board) throws Exception;
		
		public Board getBoard(int boardNo) throws Exception;
		
		public void updateBoard(Board board) throws Exception;
		
		public int deleteBoard(int boardNo) throws Exception;
		
		public Map<String, Object> getBoardList(Search search) throws Exception;
		
		public Map<String, Object> getBoardImgList(int boardNo) throws Exception;
		
}
