package com.edu.service;

import java.util.List;

import com.edu.domain.*;
import com.edu.repository.CommentRepository;
import com.edu.repository.CourseRepository;
import com.edu.repository.CourseScoreRepository;
import com.edu.repository.RecommendCourseDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static java.lang.Math.round;

@Service("com.Edu.Service.CommentService")
public class CommentService {

   @Autowired
   CommentRepository commentRepository;

   @Autowired
   CourseScoreRepository courseScoreRepository;

   @Autowired
   CourseRepository courseRepository;

   @Autowired
   RecommendCourseDataRepository recommendCourseDataRepository;

   public List<CommentDomain> commentListService(int cosno) throws Exception{
       
       return commentRepository.findAllByCosno(cosno);
   }
   
   public void commentInsertService(CommentVO comment) throws Exception{
       
       commentRepository.save(CommentDomain.builder()
               .cosno(comment.getCosno())
               .content(comment.getContent())
               .writer(comment.getWriter())
               .eva_count(comment.getEva_count())
               .userno(comment.getUserno())
               .build());
   }
   
   public int commentUpdateService(CommentVO comment) throws Exception{

       CommentDomain oldComment = commentRepository.findAllByCno(comment.getCno());

       commentRepository.save(CommentDomain.builder()
               .cno(oldComment.getCno())
               .cosno(oldComment.getCosno())
               .userno(oldComment.getUserno())
               .content(comment.getContent())
               .eva_count(comment.getEva_count())
               .build());

       return 1;
   }
   
   public int commentDeleteService(int cno) throws Exception{

       CommentDomain targetComment = commentRepository.findAllByCno(cno);
       
       commentRepository.delete(targetComment);

       return 1;
   }



public void commentScoreAdd(CommentVO comment) throws Exception{

    CourseScoreDomain targetScore = courseScoreRepository.findAllByCosno(comment.getCosno());

    CourseDomain targetCourse = courseRepository.findAllByCosno(comment.getCosno());

    courseScoreRepository.save(targetScore.builder()
            .cosno(comment.getCosno())
            .totalscore(targetScore.getTotalscore() + comment.getEva_count())
            .totalcnt(targetScore.getTotalcnt() + 1)
            .score( round( (targetScore.getTotalscore() / targetScore.getTotalcnt() )*100)/100.0 )
            .build());

    targetScore = courseScoreRepository.findAllByCosno(comment.getCosno());

    courseRepository.save(targetCourse.builder()
            .cosName(targetCourse.getCosname())
            .cosIntro(targetCourse.getCosintro())
            .cosIntrovideo(targetCourse.getCosintrovideo())
            .cosCategory1(targetCourse.getCoscategory1())
            .cosCategory2(targetCourse.getCoscategory2())
            .cosRegTime(targetCourse.getCosregtime())
            .cosPicture(targetCourse.getCospicture())
            .cosNo(comment.getCosno())
            .cosEval( (int)round(targetScore.getScore()) )
            .build());


    recommendCourseDataRepository.save(RecommendCourseDataDomain.builder()
            .cosno(comment.getCosno())
            .userno(comment.getUserno())
            .userscore(comment.getEva_count())
            .build());

}

}
