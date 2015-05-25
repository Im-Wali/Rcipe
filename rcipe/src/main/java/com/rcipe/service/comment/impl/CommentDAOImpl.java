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
	public int insertBoardCmt(Comment comment) throws Exception {
		return sqlSession.insert("commentMapper.inserBoardCmt",comment);
	}

	@Override
	public List<Comment> getBoardCmtList(int boardNo) throws Exception {
		return sqlSession.selectList("commentMapper.getBoardCmtList",boardNo);
	}

	@Override
	public int updateBoardCmt(Comment comment) throws Exception {
		return sqlSession.update("commentMapper.updateBoardCmt",comment);
	}

	@Override
	public int deleteBoardCmt(int commentNo) throws Exception {
		sqlSession.delete("commentMapper.deleteBoardCmt",commentNo);
		return sqlSession.delete("commentMapper.deleteComment",commentNo);
	}

	@Override
	public int deleteBoardCmtList(int boardNo) throws Exception {
		List<String> list =sqlSession.selectList("commentMapper.getBoardsCmtCmtNo",boardNo);
		sqlSession.delete("commentMapper.deleteBoardCmtList",boardNo);
		return sqlSession.delete("commentMapper.deleteCommentList",list);
	}

}
