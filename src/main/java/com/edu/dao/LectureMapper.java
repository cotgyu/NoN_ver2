package com.edu.dao;

import com.edu.domain.Lecture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LectureMapper {

    List getCheckedLecture(@Param("userId") String userId, @Param("courseNumber") int courseNumber);

    Lecture getLastedLecture(@Param("userId") String userId, @Param("courseNumber") int courseNumber);

}
