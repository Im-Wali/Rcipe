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
	public Comment insertBoardCmt(Comment comment) throws Exception {
		return commentDAO.insertBoardCmt(comment);
	}
	
	@Override
	public Comment insertReply(Comment comment) throws Exception {
		return commentDAO.insertReply(comment);
	}

	@Override
	public List<Comment> getBoardCmtList(int boardNo) throws Exception {
		return commentDAO.getBoardCmtList(boardNo);
	}
	
	@Override
	public List<Comment> getRecipeCmtList(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return commentDAO.getRecipeCmtList(rcp_no);
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
	public int deleteReply(int commentNo,int commentReNo) throws Exception {
		return commentDAO.deleteReply(commentNo,commentReNo);
	}

	@Override
	public int deleteBoardCmt(int commentNo) throws Exception {
		return commentDAO.deleteBoardCmt(commentNo);
	}
	
	@Override
	public int deleteRecipeCmt(int commentNo) throws Exception {
		return commentDAO.deleteRecipeCmt(commentNo);
	}

	@Override
	public int deleteBoardCmtList(int boardNo) throws Exception {
		return commentDAO.deleteBoardCmtList(boardNo);
	}
	
	@Override
	public int deleteRecipeCmtList(int rcp_no) throws Exception {
		return commentDAO.deleteRecipeCmtList(rcp_no);
	}

	

}
