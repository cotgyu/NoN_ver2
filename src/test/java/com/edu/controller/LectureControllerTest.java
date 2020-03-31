package com.edu.controller;


import com.edu.common.BaseControllerTest;
import com.edu.service.LectureService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.test.web.servlet.ResultActions;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

public class LectureControllerTest extends BaseControllerTest {

    @Autowired
    LectureService lectureService;

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


}
