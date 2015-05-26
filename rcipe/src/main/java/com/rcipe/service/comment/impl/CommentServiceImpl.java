package com.rcipe.service.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rcipe.service.comment.CommentDAO;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.domain.Comment;

@Service("commentServiceImpl")
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
	public int insertReply(Comment comment) throws Exception {
		return commentDAO.insertReply(comment);
	}

	@Override
	public List<Comment> getBoardCmtList(int boardNo) throws Exception {
		return commentDAO.getBoardCmtList(boardNo);
	}
	

	@Override
	public List<Comment> getCommentReplyList(int commenRetNo) throws Exception {
		return commentDAO.getCommentReplyList(commenRetNo);
	}

	@Override
	public int updateComment(Comment comment) throws Exception {
		return commentDAO.updateComment(comment);
	}
	
	@Override
	public int deleteReply(int commentReNo) throws Exception {
		return commentDAO.deleteReply(commentReNo);
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
