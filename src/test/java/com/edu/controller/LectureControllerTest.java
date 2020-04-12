package com.edu.controller;


import com.Edu.commons.CommonExceptionHandler;
import com.edu.common.BaseControllerTest;
import com.edu.controller.LectureController;
import com.edu.service.LectureService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.io.IOException;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class LectureControllerTest extends BaseControllerTest {

    @Autowired
    LectureService lectureService;

    @Autowired
    LectureController lectureController;

    // 전역 Exception Handler 설정
    @Before
    public void setUp() {
        this.mockMvc = MockMvcBuilders
                .standaloneSetup(lectureController)
                .setControllerAdvice(new CommonExceptionHandler())
                .build();
    }

    @Test
    @Description("특정 사용자 코스의 현재 강의 정보 가져오기(체크한 강의)")
    public void readUserCheckedLectureInfo() throws Exception{
        //Given
        String userId = "admin2";
        int courseNumber = 54;

        //When && Then
        mockMvc.perform(post("/lecture/getCheckedLectureInfo")
            .param("userId", userId)
            .param("courseNumber", Integer.toString(courseNumber))

        )
                .andDo(print())
                .andExpect(jsonPath("checkedList").exists())


        ;

    }

    @Test
    @Description("특정 사용자 코스의 현재 강의 정보 가져오기(최신 강의)")
    public void readUserLastedLectureInfo() throws Exception{
        //Given
        String userId = "admin2";
        int courseNumber = 54;

        //When && Then
        mockMvc.perform(post("/lecture/getLastedLectureInfo")
                .param("userId", userId)
                .param("courseNumber", Integer.toString(courseNumber))

        )
                .andDo(print())
                .andExpect(jsonPath("checkedList").exists())


        ;

    }

    @Test
    @Description("존재 하지 않는 사용자 강의 가져오기")
    public void readNonexistentUserLectureInfo() throws Exception{
        //Given
        String userId = "admin3";
        int courseNumber = 54;

        //When && Then
        mockMvc.perform(post("/lecture/getCheckedLectureInfo")
                .param("userId", userId)
                .param("courseNumber", Integer.toString(courseNumber))

        )
                .andDo(print())
                .andExpect(jsonPath("error").exists())

        ;
    }

    @Test
    @Description("Exception 발생 테스트")
    public void exceptionTest() throws Exception{

        // Given
        String userId = "admin2";


        // Then
        mockMvc.perform(post("/lecture/checkedLecture")
                .param("userId", userId)

        ).andDo(print())
                .andExpect(status().is2xxSuccessful())
                .andExpect(view().name("exception"))
                .andExpect(model().attributeExists("exception"))
        ;


    }



}
