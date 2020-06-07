package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseRepositoryCustom {

    CourseDomain findCos(int cosNum);

    List<CourseDomain> findNewCosList();

    List<CourseDomain> findPopCosList();

    List<String> findCosCategory1();

    List<String> findCosCategory2();

    List<String> findDetailCategory(String category);

    String findCosName(int cosNum);

    List<CourseDomain> findCosList(int start, int end, String searchOption, String keyword);

    long countCourse(String searchOption, String keyword);

    List<CourseDomain> myCourse(String userId);



}
