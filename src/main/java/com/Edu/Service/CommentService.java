//package com.example.demo.board.service;
package com.Edu.Service;
//서비스가 트랜젝션을 의미한다.

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

//import com.example.demo.board.domain.CommentVO;
import com.Edu.Domain.CommentVO;
//import com.example.demo.board.mapper.CommentMapper;
import com.Edu.Dao.CommentMapper;

//@Service("com.example.demo.board.service.CommentService")
@Service("com.Edu.Service.CommentService")
public class CommentService {

   //@Resource(name="com.example.demo.board.mapper.CommentMapper")
   @Resource(name="com.Edu.Dao.CommentMapper")
	CommentMapper mCommentMapper;
   
   public List<CommentVO> commentListService(int cosno) throws Exception{
       
       return mCommentMapper.commentList(cosno);
   }
   
   public int commentInsertService(CommentVO comment) throws Exception{
       
       return mCommentMapper.commentInsert(comment);
   }
   
   public int commentUpdateService(CommentVO comment) throws Exception{
       
       return mCommentMapper.commentUpdate(comment);
   }
   
   public int commentDeleteService(int cno) throws Exception{
       
       return mCommentMapper.commentDelete(cno);
   }

/*   public double commentEvaService(int cosno) throws Exception{

	return mCommentMapper.commentEva(cosno);
}*/
   public List<CommentVO> commentEvaService(int cosno) throws Exception{

	return mCommentMapper.commentEva(cosno);
}

public void commentScoreAdd(CommentVO comment) throws Exception{
	mCommentMapper.commentScoreAdd(comment);
	mCommentMapper.commentScoreUpdate(comment);
	mCommentMapper.recommendCourseDataInsert(comment);
	
	
}

}
