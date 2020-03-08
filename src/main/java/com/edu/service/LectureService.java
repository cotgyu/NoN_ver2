package com.edu.service;

import com.edu.dao.LectureMapper;
import com.edu.domain.Lecture;
import com.edu.domain.Member;
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
}
