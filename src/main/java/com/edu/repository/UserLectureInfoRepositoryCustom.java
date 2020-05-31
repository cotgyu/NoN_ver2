package com.edu.repository;

import com.edu.domain.UserLectureInfoDomain;

public interface UserLectureInfoRepositoryCustom {

    UserLectureInfoDomain getLectureInfo(String userId, int lectureNum, int courseNum);
}
