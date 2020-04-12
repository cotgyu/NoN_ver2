package com.edu.controller;

import com.edu.domain.Lecture;
import com.edu.domain.Member;
import com.edu.service.CourseService;
import com.edu.service.LectureService;
import com.edu.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    private static final Logger logger = LoggerFactory.getLogger(LectureController.class);

    @Autowired
    MemberService memberService;

    @Autowired
    CourseService courseService;

    @Autowired
    LectureService lectureService;

    @ResponseBody
    @RequestMapping("/getCheckedLectureInfo")
    public Map getCheckedLectureInfo(String courseNumber, String userId){

        // 사용자
        Member loginMember = memberService.login(userId);

        Map<String, Object> resultMap = new HashMap<>();

        if(loginMember == null){
            logger.debug("해당 사용자가 존재하지 않습니다.");

            resultMap.put("error", "해당 사용자가 존재하지 않습니다.");

            return resultMap;
        }

        // 해당 사용자의 체크한 강의번호 조회
        List checkedList = lectureService.getCheckedLecture(loginMember.getId(), Integer.parseInt(courseNumber));

        resultMap.put("checkedList", checkedList);

        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/getLastedLectureInfo")
    public Map getLastedLectureInfo(String courseNumber, String userId){

        // 사용자
        Member loginMember = memberService.login(userId);

        Map<String, Object> resultMap = new HashMap<>();

        if(loginMember == null){
            logger.debug("해당 사용자가 존재하지 않습니다.");

            resultMap.put("error", "해당 사용자가 존재하지 않습니다.");

            return resultMap;
        }

        // 해당 사용자의 최신강의 조회
        Lecture lastedLecture = lectureService.getLastedLecture(loginMember, Integer.parseInt(courseNumber));

        resultMap.put("lastedLecture", lastedLecture);

        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/checkedLecture")
    public Map checkedLecture(String courseNumber, String lectureNumber, String userId) {

        // 사용자
        Member loginMember = memberService.login(userId);

        Map<String, Object> resultMap = new HashMap<>();

        if(loginMember == null){
            logger.debug("해당 사용자가 존재하지 않습니다.");

            resultMap.put("error", "해당 사용자가 존재하지 않습니다.");

            return resultMap;
        }

        // 강의 체크 반영
        String result = lectureService.updateCheckedLecture(Integer.parseInt(courseNumber), Integer.parseInt(lectureNumber), loginMember);

        resultMap.put("resultMessage", result);

        return resultMap;
    }

/*
    // Controller에 직접 ExceptionHandler 선언
    @ExceptionHandler(Exception.class)
    public Object nullex(Exception e) {
        System.err.println(e.getClass());
        return "myService";
    }
    */


}
