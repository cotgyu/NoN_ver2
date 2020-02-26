package com.edu.domain;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


//DB Layer 접근자(DAO), JpaRepository<Entity, PK타입 > 을 상속하면 기본적인 CRUD 메소드가 자동 생성됨.
@Transactional
public interface JPADomainRepository extends JpaRepository<JPADomain, Long> {


    @Query(value = "SELECT p " +
            "FROM JPADomain p WHERE id = 1"
            )
    JPADomain QueryTest();

    @Modifying
    @Query(value = "INSERT  INTO jpadomain (title, content) values (2,2)"
            ,nativeQuery = true)
    void insertQueryTest();


}
