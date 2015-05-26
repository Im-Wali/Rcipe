package com.rcipe.service.comment;

import java.util.List;

import com.rcipe.service.domain.Comment;

public interface CommentService {
		public int insertBoardCmt(Comment comment)throws Exception;
		
		public int insertReply(Comment comment) throws Exception ;
		
		public  List<Comment> getBoardCmtList(int boardNo)throws Exception;
		
		public List<Comment> getCommentReplyList(int commenRetNo) throws Exception ;
		
		public int updateComment(Comment comment)throws Exception;
		
		public int deleteBoardsCmt(int commentNo)throws Exception;
		
		public int deleteReply(int commentReNo) throws Exception ;
		
		public int deleteBoardCmtList(int boardNo)throws Exception;

}
