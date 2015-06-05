package com.rcipe.service.comment;

import java.util.List;

import com.rcipe.service.domain.Comment;

public interface CommentDAO {
	
	public Comment insertBoardCmt(Comment comment)throws Exception;
	
	public Comment insertRecipeCmt(Comment comment) throws Exception ;
	
	public Comment insertReply(Comment comment) throws Exception ;
	
	public List<Comment> getBoardCmtList(int boardNo)throws Exception;
	
	public List<Comment> getRecipeCmtList(int rcp_no)throws Exception;
	
	public List<Comment> getCommentReplyList(int commenRetNo) throws Exception;
	
	public int updateComment(Comment comment)throws Exception;
	
	public int deleteBoardCmt(int commentReNo)throws Exception;
	
	public int deleteRecipeCmt(int commentNo) throws Exception;
	
	public int deleteReply(int commentNo,int commentReNo) throws Exception ;
	
	public int deleteBoardCmtList(int boardNo)throws Exception;

	public int deleteRecipeCmtList(int rcp_no) throws Exception;



}
