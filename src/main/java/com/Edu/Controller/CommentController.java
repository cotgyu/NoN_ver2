//package com.example.demo.board.controller;
package com.Edu.Controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
//import com.example.demo.board.domain.CommentVO;
import com.Edu.Domain.CommentVO;
import com.Edu.Domain.Member;
//import com.example.demo.board.service.CommentService;
import com.Edu.Service.CommentService;;

@Controller
@RequestMapping("/comment")
public class CommentController {
 
    //@Resource(name="com.example.demo.board.service.CommentService")
    @Resource(name="com.Edu.Service.CommentService")
	CommentService mCommentService;
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<CommentVO> mCommentServiceList(Model model,@RequestParam int cosno) throws Exception{
        
        return mCommentService.commentListService(cosno);
    }
    
    /*@RequestMapping("/eva")//댓글 평점,평점평균값 하나만 리턴하므로...
    @ResponseBody
    private double mCommentServiceEva(@RequestParam int cosno) throws Exception {
    	
    	return mCommentService.commentEvaService(cosno);
    }*/
    
    @RequestMapping("/eva")//댓글 평점 
    @ResponseBody
    private List<CommentVO> mCommentServiceEva(Model model, @RequestParam int cosno) throws Exception {
    	
    	return mCommentService.commentEvaService(cosno);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(HttpSession session,@RequestParam int cosno,@RequestParam int eva_count, @RequestParam String content) throws Exception{
    	
        CommentVO comment = new CommentVO();
        comment.setCosno(cosno);
        comment.setContent(content);
        comment.setEva_count(eva_count);//댓글 입력 시 평점까지.
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
        //comment.setWriter("test");
        Member member=(Member)session.getAttribute("member");
        comment.setWriter(member.getNick());
        comment.setUserno(member.getUserno());
        
        mCommentService.commentScoreAdd(comment);
        
        return mCommentService.commentInsertService(comment);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno,@RequestParam int eva_count, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        comment.setEva_count(eva_count);
        return mCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }
    
}


