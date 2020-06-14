package com.edu.repository;

import com.edu.domain.CommentDomain;
import com.edu.domain.CourseDomain;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<CommentDomain, Long> {

    List<CommentDomain> findAllByCosno(int cosno);

    CommentDomain findAllByCno(int cno);


}
