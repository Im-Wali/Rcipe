package com.rcipe.web.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rcipe.commons.Page;
import com.rcipe.commons.Search;
import com.rcipe.service.board.BoardService;
import com.rcipe.service.domain.Board;
import com.rcipe.service.domain.User;

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
	public  String  inserBoard(Model model,@ModelAttribute("board") Board board,
			HttpSession session) throws Exception {
		User user=new User("user01","user01@naver.com","1111","!!!!");
//		User user=(User)session.getAttribute("user");
		board.setBoardImgPath((String)session.getAttribute("boardImgPath"));
		board.setNickname(user.getNickname());
		boardService.insertBoard(board);
		session.removeAttribute("boardImgPath");
		return "forward:/main/boardList.jsp";
	}
	
	@RequestMapping(value = "/viewModifyBoard", method = RequestMethod.GET)
	public  String  viewModifyBoard(Model model,@RequestParam("boardNo") String boardNo,HttpSession session)throws Exception{
		Board board=boardService.getBoard(Integer.parseInt(boardNo));
		session.setAttribute("boardImgPath",board.getBoardImgPath());
		model.addAttribute("board",board);
		return "forward:/main/modifyBoard.jsp";
	}
	
	@RequestMapping(value = "/modifyBoard", method = RequestMethod.POST)
	public  String  modifyBoard(Model model,@ModelAttribute("board") Board board,HttpSession session)throws Exception{
		boardService.updateBoard(board);
		session.removeAttribute("boardImgPath");
		model.addAttribute("board",boardService.getBoard(board.getBoardNo()));
		return "forward:/main/viewBoard.jsp";
	}
	
	@RequestMapping(value = "/viewBoard", method = RequestMethod.GET)
	public  String  viewBoard(Model model,@RequestParam("boardNo") String boardNo)throws Exception{
		model.addAttribute("board",boardService.getBoard(Integer.parseInt(boardNo)));
		return "forward:/main/viewBoard.jsp";
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
