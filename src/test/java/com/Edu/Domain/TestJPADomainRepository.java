package com.Edu.Domain;


import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;


import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@SpringBootTest //기존 스프링test의 @ContextConfiguration 의 발전된 기능 ? 다양한 기능이 있으니 찾아볼 것
public class TestJPADomainRepository {

    @Autowired
    JPADomainRepository jpaDomainRepository;


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
