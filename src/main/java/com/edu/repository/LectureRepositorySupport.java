package com.edu.repository;

import com.edu.domain.Lecture;
import com.edu.domain.LectureDomain;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.data.jpa.repository.support.QueryDslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.edu.domain.QLectureDomain.lectureDomain;

@Repository
public class LectureRepositorySupport extends QueryDslRepositorySupport {

    private final JPAQueryFactory queryFactory;

    public LectureRepositorySupport(JPAQueryFactory queryFactory){
        super(Lecture.class);
        this.queryFactory = queryFactory;
    }

    public List<LectureDomain> findByCosNo(int cecno){
        return queryFactory.selectFrom(lectureDomain)
                .where(lectureDomain.cosno.eq(cecno))
                .fetch();
    }




}
