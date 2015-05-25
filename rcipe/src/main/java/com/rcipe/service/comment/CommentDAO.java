package com.rcipe.service.comment;

import java.util.List;

import com.rcipe.service.domain.Comment;

public interface CommentDAO {
	
	public int insertBoardCmt(Comment comment)throws Exception;
	
	public List<Comment> getBoardCmtList(int boardNo)throws Exception;
	
	public int updateBoardCmt(Comment comment)throws Exception;
	
	public int deleteBoardCmt(int commentNo)throws Exception;
	
	public int deleteBoardCmtList(int boardNo)throws Exception;

}
