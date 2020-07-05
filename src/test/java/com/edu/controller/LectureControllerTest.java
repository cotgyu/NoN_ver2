package com.edu.controller;


import com.edu.common.BaseControllerTest;
import com.edu.dto.LectureDto;
import com.edu.service.LectureService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import static org.mockito.Matchers.any;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@Slf4j
public class LectureControllerTest extends BaseControllerTest {

    private static Logger logger = LoggerFactory.getLogger(LectureControllerTest.class);

    @Autowired
    LectureService lectureService;

    @Autowired
    LectureController lectureController;

    /* 전역 Exception Handler 설정
    CommonExceptionHandler 에서 처리하기 위한 셋팅: standaloneSetup, setControllerAdvice 지정

    지정 파라미터를 다른 값으로 변경하면 CommonExceptionHandler에 안들어온다.
    하지만 아예 이 부분을 제거하면 CommonExceptionHandler에 옴..
     */
//    @Before
//    public void setUp() {
//        this.mockMvc = MockMvcBuilders
//                .standaloneSetup(lectureController)
//                .setControllerAdvice(new CommonExceptionHandler())
//                .build();
//    }

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

        // When (실패함. 어떻게 사용하는 지 더 찾아볼 것)
        //when(lectureController.checkedLecture(anyString(),anyString(),anyString())).thenThrow(new Exception("테스트입니다."));

        // Then
        mockMvc.perform(post("/lecture/checkedLecture")
                .param("userId", userId)

        ).andDo(print())
                .andExpect(status().is2xxSuccessful())
                .andExpect(view().name("exception"))
                .andExpect(model().attributeExists("exception"))
        ;

    }

    @Test
    @Description("Slf4j 테스트")
    public void loggerTest(){

        logger.error("Logger 테스트");

        log.error("slf4j 테스트");

    }

    @Test
    @Description("getCheckedLectureInfoValidate 테스트")
    public void validateTest() throws Exception{

        LectureDto lectureDto = LectureDto.builder().cosno(0).userId("admin").build();

        // Then
        mockMvc.perform(post("/lecture/getCheckedLectureInfo")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                .content(this.objectMapper.writeValueAsString(lectureDto))
        ).andDo(print())
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("errorMsg").exists())
                .andExpect(jsonPath("errorMsgDetail").exists())

        ;

    }

    @Test
    @Description("checkedLectureValidate 테스트")
    public void validateTest2() throws Exception{

        LectureDto lectureDto = LectureDto.builder().cosno(0).lecno(0).userId("admin").build();

        // Then
        mockMvc.perform(post("/lecture/checkedLecture")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                .content(this.objectMapper.writeValueAsString(lectureDto))
        ).andDo(print())
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("errorMsg").exists())
                .andExpect(jsonPath("errorMsgDetail").exists())

        ;

    }


    @Test
    @Description("시큐리티 테스트")
    public void securityTest() throws Exception{

        mockMvc.perform(get("/resetPassword"))
                .andDo(print())
                .andExpect(status().is3xxRedirection());
    }


}
