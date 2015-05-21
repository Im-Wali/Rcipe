package com.rcipe.web.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rcipe.service.board.BoardService;
import com.rcipe.service.domain.Board;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService boardService;
	public BoardController() {
		System.out.println("BoardController Start()....");
	}
	
	@RequestMapping(value = "/inserBoard", method = RequestMethod.POST)
	public  void  uploadBoard(Model model,@ModelAttribute("board") Board board,
			HttpSession session) throws Exception {
		System.out.println(board);
	}

}
