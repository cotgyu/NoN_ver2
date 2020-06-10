package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import java.util.List;

import static com.edu.domain.QCourseDomain.courseDomain;
import static com.edu.domain.QSubscribeDomain.subscribeDomain;

@RequiredArgsConstructor
public class MemberRepositoryImpl implements MemberRepositoryCustom {

    private final JPAQueryFactory queryFactory;



}
