package com.Edu.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Edu.Dao.EtcMapper;
import com.Edu.Domain.Board;
import com.Edu.Service.BoardService;
import com.Edu.Service.EtcService;

@Controller
public class BoardController {    
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
 
	@Autowired
	private BoardService boardService;

	@Autowired
	private EtcService etcService;	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(){
		return "register";
	}
	
	
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
	public String Board(@PathVariable int boardId, ModelAndView mav){
//		boardService.getCode("");
		mav.addObject(etcService.findByGroup(""));
		return "boardForm";
	}
//	
//	@RequestMapping(value = "/board/add", method = RequestMethod.POST)
//	public void Board(Board board ){
//		boardService.create(board);
//	}
//	
//	@RequestMapping(value = "/board/update/{boardId}", method = RequestMethod.PUT)
//	public void Board(Board board, @PathVariable int boardId ){
//		boardService.update(board);
//	}
//	
//	@RequestMapping(value = "/board/update/{boardId}", method = RequestMethod.DELETE)
//	public void Board(@PathVariable int boardId ){
//		boardService.delete(boardId);
//	}
}
