package com.rcipe.web.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
	
	@Autowired
	ServletContext cx;
	public BoardController() {
		System.out.println("BoardController Start()....");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public  String  inserBoard(Model model,@ModelAttribute("board") Board board,
			HttpSession session) throws Exception {
		User user=(User)session.getAttribute("user");
		board.setBoardImgPath((String)session.getAttribute("boardImgPath"));
		board.setNickname(user.getNickname());
		boardService.insertBoard(board);
		session.removeAttribute("boardImgPath");
		return "forward:../../board/boardList.jsp";
	}
	@RequestMapping(value = "/getInsertBoard", method = RequestMethod.GET)
	public  String  getInsertBoard()throws Exception{
		return "forward:http://127.0.0.1:8080/rcipe/board/boardList.jsp";
	}
	@RequestMapping(value = "/viewModifyBoard", method = RequestMethod.GET)
	public  String  viewModifyBoard(Model model,@RequestParam("boardNo") int boardNo,HttpSession session)throws Exception{
		Board board=boardService.getBoard(boardNo);
		session.setAttribute("boardImgPath",board.getBoardImgPath());
		model.addAttribute("board",board);
		return "forward:../../board/modifyBoard.jsp";
	}
	
	@RequestMapping(value = "/modifyBoard", method = RequestMethod.POST)
	public  String  modifyBoard(Model model,@ModelAttribute("board") Board board,HttpSession session)throws Exception{
		boardService.updateBoard(board);
		session.removeAttribute("boardImgPath");
		model.addAttribute("board",boardService.getBoard(board.getBoardNo()));
		return "forward:http://127.0.0.1:8080/rcipe/board/viewBoard.jsp";
	}
	
	@RequestMapping(value = "/viewBoard", method = RequestMethod.GET)
	public  String  viewBoard(Model model,@RequestParam("boardNo") int boardNo)throws Exception{
		model.addAttribute("board",boardService.getBoard(boardNo));
		return "forward:http://127.0.0.1:8080/rcipe/board/viewBoard.jsp";
	}
	
	@RequestMapping(value = "/getBoardListFirst", method = RequestMethod.GET)
	public ModelAndView  getBoardListFirst( @ModelAttribute("search") Search search) throws Exception {
		System.out.println("getBoardList start");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=boardService.getBoardList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:../../board/boardList.jsp");
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("list", map.get("list"));
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public ResponseEntity<String>  getBoardList( @ModelAttribute("search") Search search, ModelMap model,@RequestParam("pageSize") int pageSize) throws Exception {
		System.out.println("getBoardList start");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=boardService.getBoardList(search);
		
		System.out.println("map : "+map);
		System.out.println("map.get(list) : "+map.get("list"));
		System.out.println("Search : "+search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String,Object> result = new HashMap<String,Object>();
		
		result.put("list", map.get("list"));
		result.put("resultPage", resultPage);
		result.put("search", search);
		result.put("flag", "Y");
		Gson gson = new GsonBuilder().serializeNulls().create();
		String jsonString = gson.toJson(result);
		
		// list.add();
//		
//		
//		model.put("search", search);
//		model.put("list", map.get("list"));
//		
		System.out.println("jsonString : "+jsonString);
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("boardNo") int boardNo,@RequestParam("boardImgPath") String boardImgPath)throws Exception{
		System.out.println(cx.getRealPath("/images")+boardImgPath);
		boardService.deleteBoard(boardNo,cx.getRealPath("/images")+boardImgPath);
		return "forward:http://127.0.0.1:8080/rcipe/board/boardList.jsp";
	}
}
