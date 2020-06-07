package com.edu.domain;


import com.edu.repository.JPADomainRepository;
import com.edu.repository.LectureRepository;
import com.edu.repository.UserLectureInfoRepository;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Description;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest //기존 스프링test의 @ContextConfiguration 의 발전된 기능 ? 다양한 기능이 있으니 찾아볼 것
public class TestJPADomainRepository {

    @Autowired
    JPADomainRepository jpaDomainRepository;

    @Autowired
    LectureRepository lectureRepository;

    @Autowired
    UserLectureInfoRepository userLectureInfoRepository;


    private static final Logger logger = LoggerFactory.getLogger(TestJPADomainRepository.class);

    @After
    public void cleanup(){
        jpaDomainRepository.deleteAll();
    }

    @Test
    public void saveTest(){

        //테스트 환경 구축
        jpaDomainRepository.save(JPADomain.builder()
                .title("테스트title")
                .content("테스트content")
                .build());


        //테스트 행위
        List<JPADomain> postsList = jpaDomainRepository.findAll();

        //테스트 검증
        JPADomain posts = postsList.get(0);
        assertThat(posts.getTitle(), is("테스트title"));
        assertThat(posts.getContent(), is("테스트content"));

    }


    @Test
    public void insertTest(){

        //insert @Query 테스트
        jpaDomainRepository.insertQueryTest();

        //테스트 행위
        List<JPADomain> postsList = jpaDomainRepository.findAll();

        //테스트 검증
        JPADomain posts = postsList.get(0);
        assertThat(posts.getTitle(), is("2"));
        assertThat(posts.getContent(), is("2"));


    }

    @Test
    @Description("Lecture 전환 테스트")
    public void lectureRepositoryTest(){

        //given & when
        List<LectureDomain> lectureList = lectureRepository.findAll();

        //then
        LectureDomain lecture = lectureList.get(0);
        assertThat(lecture.getLecno(), is(1));


    }


    @Test
    @Description("querydsl 테스트")
    public void querydslTest(){
        int courseNo  = 1;

        //when
        List<LectureDomain> lectureList = lectureRepository.findAllByCosno(courseNo);

        //then
        assertThat(lectureList.get(0).getLecname(), is("test1"));

    }

    @Test
    @Description("querydsl 컬럼 select 테스트")
    public void selectTest(){

        String id = "admin2";
        int courseNum = 54;


        List<Integer> info = lectureRepository.getCheckedLecture(id, courseNum);

        int lastedNum = info.get(0);

        assertThat(lastedNum, is(4));

    }

    @Test
    @Description("getLectureInfo 테스트")
    public void getLectureInfo(){
        String userid = "admin2";
        int courseNum = 54;
        int lecNum = 5;

        UserLectureInfoDomain get = userLectureInfoRepository.getLectureInfo(userid, lecNum, courseNum);

    }


    @Test
    @Description("querydsl where절 서브쿼리 테스트")
    public void whereTest(){
        String id = "admin2";
        int courseNum = 54;

        LectureDomain lasted = lectureRepository.getLastedLecture(id, courseNum);

        int lastedLectureNum = lasted.getLecno();

        assertThat(lastedLectureNum, is(6));

    }



    @Test
    @Description("lectureinfo save update 테스트")
    public void lectureSaveTest(){
        String userId = "admin2";
        int courseNum = 999;
        int lecturenum = 99;


        userLectureInfoRepository.save(UserLectureInfoDomain.builder()
                .lectureInfoNum(5)
                .userId(userId)
                .courseNum(courseNum)
                .lectureNum(lecturenum)
                .delFlag("N")
                .build());

    }


    //log 테스트
    @Test
    public void loggingTest(){

        logger.error("error log");
        logger.warn("warn log");
        logger.info("info log");
        logger.debug("debug log");
        logger.trace("trace log");

    }

}
