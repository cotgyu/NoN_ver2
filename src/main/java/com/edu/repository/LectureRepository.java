package com.edu.repository;

import com.edu.domain.LectureDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LectureRepository extends JpaRepository<LectureDomain, Long> {

    LectureDomain findByLecno(Integer lecno);


}
