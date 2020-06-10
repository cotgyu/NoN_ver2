package com.edu.repository;

import com.edu.domain.UserDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<UserDomain, Long>, MemberRepositoryCustom {

    UserDomain findAllById(String id);


}
