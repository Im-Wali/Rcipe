package com.rcipe.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.commons.Search;
import com.rcipe.service.board.BoardDAO;
import com.rcipe.service.board.BoardService;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Board;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	@Qualifier("boardDAOImpl")
	private BoardDAO boardDAO;
	
/*	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;*/

	public BoardServiceImpl() {
		System.out.println("BoardServiceImpl default Constructor~!!");
	}

	@Override
	public void insertBoard(Board board) throws Exception {
		boardDAO.insertBoard(board);
	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		return boardDAO.getBoard(boardNo);
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNo) throws Exception {
		return boardDAO.deleteBoard(boardNo);
	}

	@Override
	public Map<String, Object> getBoardList(Search search) throws Exception {
		List<Board> list = boardDAO.getBoardList(search);
		int totalCount = boardDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getBoardImgList(int boardNo) throws Exception {
		List<String> list = boardDAO.getBoardImgList(boardNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

	

}
