//package com.example.demo.board.controller;
package com.edu.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.edu.domain.CommentDomain;
import com.edu.domain.UserDomain;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.domain.CommentVO;

import com.edu.service.CommentService;;

@Controller
@RequestMapping("/comment")
public class CommentController {
 
    @Resource(name="com.Edu.Service.CommentService")
	CommentService mCommentService;
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<CommentDomain> mCommentServiceList(Model model, @RequestParam int cosno) throws Exception{
        
        return mCommentService.commentListService(cosno);
    }

    
    @RequestMapping("/eva")//댓글 평점 
    @ResponseBody
    private List<CommentDomain> mCommentServiceEva(Model model, @RequestParam int cosno) throws Exception {
    	
    	return mCommentService.commentListService(cosno);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(HttpSession session,@RequestParam int cosno,@RequestParam int eva_count, @RequestParam String content) throws Exception{
    	
        CommentVO comment = new CommentVO();
        comment.setCosno(cosno);
        comment.setContent(content);
        comment.setEva_count(eva_count);//댓글 입력 시 평점까지.

        UserDomain member=(UserDomain)session.getAttribute("member");
        comment.setWriter(member.getNickname());
        comment.setUserno(member.getUsernum());
        
        mCommentService.commentScoreAdd(comment);
        
        mCommentService.commentInsertService(comment);

        return 1;
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


