package com.edu.service;

import com.edu.dao.LectureMapper;
import com.edu.domain.Lecture;
import com.edu.domain.Member;
import com.edu.domain.UserLectureInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureService {

    @Autowired LectureMapper lectureMapper;

    public Lecture getLastedLecture(Member member, int courseNumber) {

        String userId = member.getId();


        Lecture lastedLecture = lectureMapper.getLastedLecture(userId, courseNumber);

        return lastedLecture;
    }

    public List getCheckedLecture(String userId, int courseNumber){

        List checkedList = lectureMapper.getCheckedLecture(userId, courseNumber);

        return checkedList;
    }

    public String updateCheckedLecture(int courseNumber, int lectureNumber, Member member){

        // 해당 번호로 조회
        UserLectureInfo getUserLectureInfo = lectureMapper.getLectureInfo(member.getId(), courseNumber, lectureNumber);

        // 결과없으면? insert
        if(getUserLectureInfo == null){

            getUserLectureInfo = new UserLectureInfo();

            getUserLectureInfo.setUserid(member.getId());
            getUserLectureInfo.setCoursenum(courseNumber);
            getUserLectureInfo.setLecturenum(lectureNumber);
            getUserLectureInfo.setCheckflag("Y");

            lectureMapper.insertLectureInfo(getUserLectureInfo);

            return "insert";
        }


        // 결과가 있다.  Y이면 N으로 N이면 Y로 update?
        if(getUserLectureInfo.getCheckflag().equals("Y")){
            getUserLectureInfo.setCheckflag("N");
        }else {
            getUserLectureInfo.setCheckflag("Y");
        }
        try {
            // update
            lectureMapper.updateLectureInfo(getUserLectureInfo);
        }catch (Exception e){
            return "error";
        }

        return "update";
    }

}
