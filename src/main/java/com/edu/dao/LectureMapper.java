package com.edu.dao;

import com.edu.domain.Lecture;
import com.edu.domain.UserLectureInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LectureMapper {

    List getCheckedLecture(@Param("userid") String userId, @Param("coursenum") int courseNumber);

    Lecture getLastedLecture(@Param("userid") String userId, @Param("coursenum") int courseNumber);

    UserLectureInfo getLectureInfo(@Param("userid") String userId, @Param("coursenum") int courseNumber, @Param("lecturenum") int lectureNumber);

    void insertLectureInfo(UserLectureInfo getLectureInfo);

    void updateLectureInfo(UserLectureInfo getLectureInfo);


}
