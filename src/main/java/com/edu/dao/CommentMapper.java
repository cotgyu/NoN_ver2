//package com.example.demo.board.mapper;
 package com.edu.dao;
 
import java.util.List;
 
import org.springframework.stereotype.Repository;
 
//import com.example.demo.board.domain.CommentVO;
 import com.edu.domain.CommentVO;
 
 
 //@Repository("com.example.demo.board.mapper.CommentMapper")
 @Repository("com.Edu.Dao.CommentMapper")
 public interface CommentMapper {
    // 댓글 개수
     int commentCount() throws Exception;

    // 댓글 목록
     List<CommentVO> commentList(int cosno) throws Exception;

    // 댓글 작성
     int commentInsert(CommentVO comment) throws Exception;

    // 댓글 수정
     int commentUpdate(CommentVO comment) throws Exception;

    // 댓글 삭제
     int commentDelete(int cno) throws Exception;

    //댓글 평점 출력
/*	public double commentEva(int cosno) throws Exception;
*/
	 List<CommentVO> commentEva(int cosno) throws Exception;

	 void commentScoreAdd(CommentVO comment) throws Exception;

	 void commentScoreUpdate(CommentVO comment);

	 void recommendCourseDataInsert(CommentVO comment);

}


