package com.rcipe.service.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.rcipe.service.comment.CommentDAO;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Comment;

public class CommentServiceImpl  implements CommentService{

	@Autowired
	@Qualifier("commentDAOImpl")
	private CommentDAO commentDAO;
	
	public CommentServiceImpl() {
		System.out.println(getClass()+"start...");
	}

	@Override
	public int insertBoardCmt(Comment comment) throws Exception {
		return commentDAO.insertBoardCmt(comment);
	}

	@Override
	public List<Comment> getBoardCmtList(int boardNo) throws Exception {
		return commentDAO.getBoardCmtList(boardNo);
	}

	@Override
	public int updateBoardCmt(Comment comment) throws Exception {
		return commentDAO.updateBoardCmt(comment);
	}

	@Override
	public int deleteBoardsCmt(int commentNo) throws Exception {
		return commentDAO.deleteBoardCmt(commentNo);
	}

	@Override
	public int deleteBoardCmtList(int boardNo) throws Exception {
		return commentDAO.deleteBoardCmtList(boardNo);
	}

}
