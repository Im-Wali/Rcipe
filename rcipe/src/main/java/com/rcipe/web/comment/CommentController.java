package com.rcipe.web.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.rcipe.service.comment.CommentService;
import com.rcipe.service.commons.FileService;
import com.rcipe.service.domain.Comment;
import com.rcipe.service.domain.User;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	CommentService commentService;
	
	HttpHeaders headers;

	public CommentController() {
		System.out.println(getClass()+"start.....");
		headers=new HttpHeaders();
		headers.set("Content-Type", "text/plain;charset=UTF-8");
	}
	
	@RequestMapping(value = "/insertBoardCmt", method = RequestMethod.POST)
	public ResponseEntity<String> insertBoardCmt(@ModelAttribute("comment") Comment comment,HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		comment.setNickname(user.getNickname());
		commentService.insertBoardCmt(comment);
		//다시 보여주기 위해 리스트을 가져온다
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getBoardCmtList(comment.getContentNo()));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/inserReply", method = RequestMethod.POST)
	public ResponseEntity<String> inserReply(@ModelAttribute("comment") Comment comment,HttpSession session) throws Exception {
		User user=(User) session.getAttribute("user");
		comment.setNickname(user.getNickname());
		commentService.insertReply(comment);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getCommentReplyList(comment.getCommentReNo()));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public ResponseEntity<String> updateComment(@ModelAttribute("comment") Comment comment) throws Exception {
		commentService.updateComment(comment);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getBoardCmtList(comment.getContentNo()));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public ResponseEntity<String> updateReply(@ModelAttribute("comment") Comment comment) throws Exception {
		commentService.updateComment(comment);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getCommentReplyList(comment.getCommentReNo()));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deleteBoardCmt", method = RequestMethod.POST)
	public  ResponseEntity<String> deleteBoardCmt(@RequestParam("commentNo") Integer commentNo,@RequestParam("boardNo") Integer boardNo) throws Exception {
		commentService.deleteBoardCmt(commentNo);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getBoardCmtList(boardNo));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public  ResponseEntity<String>getReplyList(@RequestParam("commentReNo") Integer commentReNo) throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getCommentReplyList(commentReNo));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getBoardCmt", method = RequestMethod.POST)
	public  ResponseEntity<String> getBoardCmt(@RequestParam("contentNo") Integer contentNo) throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getBoardCmtList(contentNo));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public  ResponseEntity<String> deleteReply(@RequestParam("commentNo") Integer commentNo,@RequestParam("commentReNo") Integer commentReNo ) throws Exception {
		commentService.deleteReply(commentNo, commentReNo);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", commentService.getCommentReplyList(commentReNo));
		String jsonString = new Gson().toJson(map);
		return new ResponseEntity<String>(jsonString, headers, HttpStatus.OK);
	}
	

}
