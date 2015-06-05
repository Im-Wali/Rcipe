package com.rcipe.service.comment.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.service.comment.CommentDAO;
import com.rcipe.service.domain.Comment;
@Repository("commentDAOImpl")
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public CommentDAOImpl() {
		System.out.println("CommentDAOImpl start......");
	}

	@Override
	public Comment insertBoardCmt(Comment comment) throws Exception {
//		int t=sqlSession.selectOne("commentMapper.selectCmtNo");
//		comment.setCommentNo(t);
		sqlSession.insert("commentMapper.insertBoardCmt",comment);
		return comment ;
	}
	
	@Override
	public Comment insertRecipeCmt(Comment comment) throws Exception {
		sqlSession.insert("commentMapper.insertRecipeCmt",comment);
		return comment;
	}

	@Override
	public Comment insertReply(Comment comment) throws Exception {
		sqlSession.update("commentMapper.updateAddReplyCnt",comment);
		sqlSession.insert("commentMapper.insertReply",comment);
		return comment;
	}

	@Override
	public List<Comment> getBoardCmtList(int boardNo) throws Exception {
		return sqlSession.selectList("commentMapper.getBoardCmtList",boardNo);
	}
	
	@Override
	public List<Comment> getRecipeCmtList(int rcp_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("commentMapper.getRecipeCmtList",rcp_no);
	}
	
	@Override
	public List<Comment> getCommentReplyList(int commenRetNo) throws Exception {
		return sqlSession.selectList("commentMapper.getCommentReplyList",commenRetNo);
	}

	@Override
	public int updateComment(Comment comment) throws Exception {
		return sqlSession.update("commentMapper.updateComment",comment);
	}
	
	@Override
	public int deleteReply(int commentNo,int commentReNo) throws Exception {
		sqlSession.update("commentMapper.updateRemoveReplyCnt",commentReNo);
		return sqlSession.delete("commentMapper.deleteReply",commentNo);
	}

	@Override
	public int deleteBoardCmt(int commentNo) throws Exception {
		sqlSession.delete("commentMapper.deleteBoardCmt",commentNo);
		sqlSession.delete("commentMapper.deleteReply2",commentNo);
		return sqlSession.delete("commentMapper.deleteComment",commentNo);
	}
	
	@Override
	public int deleteRecipeCmt(int commentNo) throws Exception {
		sqlSession.delete("commentMapper.deleteRecipeCmt",commentNo);
		sqlSession.delete("commentMapper.deleteReply2",commentNo);
		return sqlSession.delete("commentMapper.deleteComment",commentNo);
	}
	
	@Override
	public int deleteBoardCmtList(int boardNo) throws Exception {
		List<Integer> list =sqlSession.selectList("commentMapper.getBoardsCmtCmtNo",boardNo);
		sqlSession.delete("commentMapper.deleteReplyList",list);
		sqlSession.delete("commentMapper.deleteBoardCmtList",boardNo);
		return sqlSession.delete("commentMapper.deleteCommentList",list);
	}

	@Override
	public int deleteRecipeCmtList(int rcp_no) throws Exception {
		List<String> list =sqlSession.selectList("commentMapper.getRecipesCmtCmtNo",rcp_no);
		sqlSession.delete("commentMapper.deleteRecipesCmtList",rcp_no);
		sqlSession.delete("commentMapper.deleteReplyList",list);
		return sqlSession.delete("commentMapper.deleteCommentList",list);
	}

	

}
