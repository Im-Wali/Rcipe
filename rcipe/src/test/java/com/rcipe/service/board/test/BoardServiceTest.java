package com.rcipe.service.board.test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rcipe.commons.Search;
import com.rcipe.service.board.BoardService;
import com.rcipe.service.domain.Board;


public class BoardServiceTest {

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public BoardServiceTest() {
		// TODO Auto-generated constructor stub

	}
	static public void main(String args[])throws Exception{
		ApplicationContext context =
				new ClassPathXmlApplicationContext(
						new String[] {	"/config/*.xml"	 }
						);
		BoardService boardService = (BoardService) context.getBean("boardServiceImpl");
		Board board=new Board(1,"user01","title77","contents",0,7777);
		Search search = new Search(1,"1"," ",1);
		
		System.out.println("getBoardList Test :"+boardService.getBoardList(search));
	}

}
