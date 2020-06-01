package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<CourseDomain, Long>, CourseRepositoryCustom {



}
