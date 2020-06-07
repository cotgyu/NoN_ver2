package com.edu.repository;

import com.edu.domain.LectureDomain;
import com.edu.domain.UserLectureInfoDomain;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import java.util.List;

import static com.edu.domain.QLectureDomain.lectureDomain;
import static com.edu.domain.QUserLectureInfoDomain.userLectureInfoDomain;

@RequiredArgsConstructor
public class LectureRepositoryImpl implements LectureRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    @Override
    public List<Integer> getCheckedLecture(String userId, int courseNum){

        return queryFactory.select(userLectureInfoDomain.lecturenum)
                .from(userLectureInfoDomain)
                .where(userLectureInfoDomain.userid.eq(userId)
                        .and(userLectureInfoDomain.coursenum.eq(courseNum))
                        .and(userLectureInfoDomain.checkflag.eq("Y"))
                        .and(userLectureInfoDomain.delflag.eq("N")))
                .fetch();
    }

    public LectureDomain getLastedLecture(String userId, int courseNum){

        return queryFactory.selectFrom(lectureDomain)
                .where(lectureDomain.lecno.in(
                        JPAExpressions.select(userLectureInfoDomain.lecturenum)
                                .from(userLectureInfoDomain)
                                .where(
                                        userLectureInfoDomain.userid.eq(userId)
                                                .and(userLectureInfoDomain.coursenum.eq(courseNum))
                                                .and(userLectureInfoDomain.checkflag.eq("Y"))
                                                .and(userLectureInfoDomain.delflag.eq("N"))
                                )
                        )
                )
                .orderBy(lectureDomain.lecno.desc())
                .limit(1)
                .fetchOne();
    }

    public LectureDomain findLecture(int lectureNum){
        return queryFactory.selectFrom(lectureDomain)
                .where(lectureDomain.lecno.eq(lectureNum))
                .fetchOne();
    }

    public List<LectureDomain> findCos_lec(int cosNum){
        return queryFactory.selectFrom(lectureDomain).where(lectureDomain.cosno.eq(cosNum)).fetch();
    }
}
