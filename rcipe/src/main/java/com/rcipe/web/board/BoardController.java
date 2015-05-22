package com.rcipe.web.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rcipe.commons.Page;
import com.rcipe.commons.Search;
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
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "/inserBoard", method = RequestMethod.POST)
	public  void  uploadBoard(Model model,@ModelAttribute("board") Board board,
			HttpSession session) throws Exception {
		System.out.println(board);
	}

	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public ModelAndView  getBoardList( @ModelAttribute("search") Search search) throws Exception {
		System.out.println("getBoardList start");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=boardService.getBoardList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:../../main/boardList.jsp");
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("list", map.get("list"));
		
		return modelAndView;
	}
	
}
