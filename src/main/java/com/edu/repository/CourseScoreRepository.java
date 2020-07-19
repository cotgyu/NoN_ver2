package com.edu.repository;

import com.edu.domain.CourseScoreDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseScoreRepository extends JpaRepository<CourseScoreDomain, Long> {

    CourseScoreDomain findAllByCosno(int cosno);

}
