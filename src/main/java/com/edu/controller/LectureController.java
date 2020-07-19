package com.edu.controller;

import com.edu.commons.LectureValidator;
import com.edu.domain.UserDomain;
import com.edu.dto.LectureDto;
import com.edu.service.CourseService;
import com.edu.service.LectureService;
import com.edu.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @Autowired
    LectureValidator lectureValidator;

    @PostMapping("/getCheckedLectureInfo")
    public ResponseEntity getCheckedLectureInfo(@RequestBody LectureDto lectureDto, Errors errors) throws Exception{

        Map<String, Object> resultMap = new HashMap<>();

        if(errors.hasErrors()){
            resultMap.put("errorMsg", "에러가 발생하였습니다.");
            resultMap.put("errorMsgDetail", errors);

            return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);
        }


        lectureValidator.getCheckedLectureInfoValidate(lectureDto, errors);

        if(errors.hasErrors()){
            resultMap.put("errorMsg", "에러가 발생하였습니다.");
            resultMap.put("errorMsgDetail", errors.getFieldError());

            return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);
        }

        int courseNumber = lectureDto.getCosno();
        String userId = lectureDto.getUserId();

        // 사용자
        UserDomain loginMember = memberService.getMemberById(userId);


        if(loginMember == null){
            logger.debug("해당 사용자가 존재하지 않습니다.");

            resultMap.put("errorMsg", "해당 사용자가 존재하지 않습니다.");

            return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);
        }

        // 해당 사용자의 체크한 강의번호 조회
        List checkedList = lectureService.getCheckedLecture(loginMember.getId(), courseNumber);

        resultMap.put("checkedList", checkedList);

        return new ResponseEntity<>(resultMap, HttpStatus.OK);
    }

    @PostMapping("/checkedLecture")
    public ResponseEntity checkedLecture(@RequestBody LectureDto lectureDto, Errors errors) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();

        String userId = lectureDto.getUserId();
        int courseNumber = lectureDto.getCosno();
        int lectureNumber = lectureDto.getLecno();

        lectureValidator.checkedLectureValidate(lectureDto, errors);


        if(errors.hasErrors()){
            resultMap.put("errorMsg", "에러가 발생하였습니다.");
            resultMap.put("errorMsgDetail", errors.getFieldError());

            return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);
        }

        // 사용자
        UserDomain loginMember = memberService.getMemberById(userId);


        if(loginMember == null){
            logger.debug("해당 사용자가 존재하지 않습니다.");

            resultMap.put("error", "해당 사용자가 존재하지 않습니다.");

            return new ResponseEntity<>(resultMap, HttpStatus.BAD_REQUEST);
        }

        // 강의 체크 반영
        String result = lectureService.updateCheckedLecture(courseNumber, lectureNumber, loginMember);

        resultMap.put("resultMessage", result);

        return new ResponseEntity<>(resultMap, HttpStatus.OK);
    }

}
