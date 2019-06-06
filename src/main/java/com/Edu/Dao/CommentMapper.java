//package com.example.demo.board.mapper;
 package com.Edu.Dao;
 
import java.util.List;
 
import org.springframework.stereotype.Repository;
 
//import com.example.demo.board.domain.CommentVO;
 import com.Edu.Domain.CommentVO;
 
 
 //@Repository("com.example.demo.board.mapper.CommentMapper")
 @Repository("com.Edu.Dao.CommentMapper")
 
 public interface CommentMapper {
    // 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<CommentVO> commentList(int cosno) throws Exception;
 
    // 댓글 작성
    public int commentInsert(CommentVO comment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(CommentVO comment) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int cno) throws Exception;

    //댓글 평점 출력
/*	public double commentEva(int cosno) throws Exception;
*/
	public List<CommentVO> commentEva(int cosno) throws Exception;

	public void commentScoreAdd(CommentVO comment) throws Exception;

	public void commentScoreUpdate(CommentVO comment);

	public void recommendCourseDataInsert(CommentVO comment);

}


