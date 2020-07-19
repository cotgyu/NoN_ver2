package com.edu.repository;

import com.edu.domain.RecommendCourseDataDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RecommendCourseDataRepository extends JpaRepository<RecommendCourseDataDomain, Long> {


}
