package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import java.util.List;

import static com.edu.domain.QCourseDomain.courseDomain;
import static com.edu.domain.QLectureDomain.lectureDomain;
import static com.edu.domain.QUserLectureInfoDomain.userLectureInfoDomain;

@RequiredArgsConstructor
public class CourseRepositoryImpl implements CourseRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<CourseDomain> findNewCosList() {
        return queryFactory.selectFrom(courseDomain).orderBy(courseDomain.cosregtime.desc()).limit(9).fetch();
    }

    @Override
    public List<CourseDomain> findPopCosList() {
        return queryFactory.selectFrom(courseDomain).orderBy(courseDomain.coseval.desc()).limit(9).fetch();
    }

    @Override
    public List<String> findCosCategory1() {
        return queryFactory.select(courseDomain.coscategory1).distinct().from(courseDomain).fetch();
    }

    @Override
    public List<String> findCosCategory2() {
        return queryFactory.select(courseDomain.coscategory2).distinct().from(courseDomain).fetch();
    }

    @Override
    public List<String> findDetailCategory(String category) {
        return queryFactory.select(courseDomain.coscategory2).distinct().from(courseDomain).where(courseDomain.coscategory1.eq(category)).fetch();
    }

    public String findCosName(int cosNum){
        return queryFactory.select(courseDomain.cosname).from(courseDomain).where(courseDomain.cosno.eq(cosNum)).fetchOne();
    }



}
