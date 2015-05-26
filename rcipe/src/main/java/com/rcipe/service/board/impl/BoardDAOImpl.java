package com.rcipe.service.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rcipe.commons.Search;
import com.rcipe.service.board.BoardDAO;
import com.rcipe.service.domain.Board;

@Repository("boardDAOImpl")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
		System.out.println("$$"+getClass()+".getSqlSession() call~!");
		this.sqlSession = sqlSession;
	}
	
	public BoardDAOImpl() {
		System.out.println("##"+getClass()+"default Constructor call~!!");
	}

	@Override
	public void insertBoard(Board board) throws Exception {
		sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public Board getBoard(int boardNo) throws Exception {
		return sqlSession.selectOne("BoardMapper.getBoard", boardNo);
	}

	@Override
	public void updateBoard(Board board) throws Exception {
		sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int boardNo) throws Exception {
		return sqlSession.delete("BoardMapper.deleteBoard", boardNo);
	}

	@Override
	public List<Board> getBoardList(Search search) throws Exception {
//		List<Board> list = sqlSession.selectList("BoardMapper.getBoardList", search);
		return sqlSession.selectList("BoardMapper.getBoardList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("BoardMapper.getTotalCount", search);
	}

	@Override
	public void updateBoardCount(Integer boardNo) throws Exception {
		 sqlSession.update("BoardMapper.updateBoardCount", boardNo);
	}
	
}
