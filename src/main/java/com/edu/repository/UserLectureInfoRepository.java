package com.edu.repository;

import com.edu.domain.UserLectureInfoDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLectureInfoRepository extends JpaRepository<UserLectureInfoDomain, Long>, UserLectureInfoRepositoryCustom {

}
