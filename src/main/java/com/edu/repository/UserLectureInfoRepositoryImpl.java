package com.edu.repository;

import com.edu.domain.UserLectureInfoDomain;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import static com.edu.domain.QUserLectureInfoDomain.userLectureInfoDomain;

@RequiredArgsConstructor
public class UserLectureInfoRepositoryImpl implements UserLectureInfoRepositoryCustom{

    private final JPAQueryFactory queryFactory;

    @Override
    public UserLectureInfoDomain getLectureInfo(String userId, int lectureNum, int courseNum){
        return queryFactory.selectFrom(userLectureInfoDomain)
                .where(userLectureInfoDomain.userid.eq(userId)
                        .and(userLectureInfoDomain.lecturenum.eq(lectureNum))
                        .and(userLectureInfoDomain.coursenum.eq(courseNum))
                        .and(userLectureInfoDomain.delflag.eq("N")))
                .fetchOne();
    }
}
