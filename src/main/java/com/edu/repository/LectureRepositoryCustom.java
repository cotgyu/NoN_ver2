package com.edu.repository;

import com.edu.domain.LectureDomain;

import java.util.List;

public interface LectureRepositoryCustom {

    List<LectureDomain> findByCosNo(int cecno);

    List<Integer> getCheckedLecture(String userId, int courseNum);

    LectureDomain getLastedLecture(String userId, int courseNum);

    LectureDomain findLecture(int lectureNum);

}
