package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;

import java.util.List;

public interface CourseRepositoryCustom {

    List<CourseDomain> findNewCosList();

    List<CourseDomain> findPopCosList();

    List<String> findCosCategory1();

    List<String> findCosCategory2();

    List<String> findDetailCategory(String category);

    String findCosName(int cosNum);




}
