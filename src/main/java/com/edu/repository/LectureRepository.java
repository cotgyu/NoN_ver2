package com.edu.repository;

import com.edu.domain.LectureDomain;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LectureRepository extends JpaRepository<LectureDomain, Long>, LectureRepositoryCustom {

    List<LectureDomain> findAllByCosno(int cecno);

}
