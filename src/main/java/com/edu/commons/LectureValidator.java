package com.edu.commons;

import com.edu.dto.LectureDto;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

@Component
public class LectureValidator {

    public void getCheckedLectureInfoValidate(LectureDto lectureDto, Errors errors){
        if(lectureDto == null){
            errors.rejectValue("lectureDomain","wrongValue", "lectureDomain is wrong.");
        }

        if(lectureDto.getCosno() <= 0 ){
            errors.rejectValue("cosno","wrongValue", "cosno is wrong.");
        }

        if(lectureDto.getUserId() == null || lectureDto.getUserId().equals("") ){
            errors.rejectValue("userId","wrongValue", "userId is wrong.");
        }

    }
}
