package com.edu.repository;

import com.edu.domain.Lecture;
import com.edu.domain.LectureDomain;
import com.edu.domain.UserLectureInfo;
import com.edu.domain.UserLectureInfoDomain;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.data.jpa.repository.support.QueryDslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.edu.domain.QLectureDomain.lectureDomain;
import static com.edu.domain.QUserLectureInfoDomain.userLectureInfoDomain;

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


    public List<Integer> getCheckedLecture(String userId, int courseNum){

        return queryFactory.select(userLectureInfoDomain.lecturenum)
                .from(userLectureInfoDomain)
                .where(userLectureInfoDomain.userid.eq(userId)
                        .and(userLectureInfoDomain.coursenum.eq(courseNum))
                        .and(userLectureInfoDomain.checkflag.eq("Y"))
                        .and(userLectureInfoDomain.delflag.eq("N")))
                .fetch();
    }






}
