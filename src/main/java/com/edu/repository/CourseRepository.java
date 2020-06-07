package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<CourseDomain, Long>, CourseRepositoryCustom {


}
