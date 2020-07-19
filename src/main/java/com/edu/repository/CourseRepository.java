package com.edu.repository;

import com.edu.domain.CourseDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<CourseDomain, Long>, CourseRepositoryCustom {

    CourseDomain findAllByCosno(int cosno);
}
