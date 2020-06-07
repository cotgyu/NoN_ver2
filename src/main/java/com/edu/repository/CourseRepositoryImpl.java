package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.LectureDomain;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Select;

import java.util.List;

import static com.edu.domain.QCourseDomain.courseDomain;
import static com.edu.domain.QLectureDomain.lectureDomain;
import static com.edu.domain.QSubscribeDomain.subscribeDomain;
import static com.edu.domain.QUserLectureInfoDomain.userLectureInfoDomain;

@RequiredArgsConstructor
public class CourseRepositoryImpl implements CourseRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    public CourseDomain findCos(int cosNum){
        return queryFactory.selectFrom(courseDomain).where(courseDomain.cosno.eq(cosNum)).fetchOne();
    }

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

    @Override
    public String findCosName(int cosNum){
        return queryFactory.select(courseDomain.cosname).from(courseDomain).where(courseDomain.cosno.eq(cosNum)).fetchOne();
    }

    @Override
    public List<CourseDomain> findCosList(int start, int end, String searchOption, String keyword){

        if(searchOption.equals("coscategory1")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.coscategory1.like(keyword)
                    ).orderBy(courseDomain.cosregtime.desc()).offset(start).limit(10).fetch();
        }

        if(searchOption.equals("coscategory2")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.coscategory2.like(keyword)
                    ).orderBy(courseDomain.cosregtime.desc()).offset(start).limit(10).fetch();
        }

        if(searchOption.equals("cosname")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.cosname.like(keyword)
                    ).orderBy(courseDomain.cosregtime.desc()).offset(start).limit(10).fetch();
        }


        return queryFactory.selectFrom(courseDomain)
                .where(courseDomain.coscategory1.like(keyword)
                        .or(courseDomain.coscategory2.like(keyword))
                        .or(courseDomain.cosname.like(keyword))
                ).orderBy(courseDomain.cosregtime.desc()).offset(start).limit(10).fetch();

    }

    @Override
    public long countCourse(String searchOption, String keyword){

        if(searchOption.equals("coscategory1")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.coscategory1.like(keyword)
                    ).fetchCount();
        }

        if(searchOption.equals("coscategory2")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.coscategory2.like(keyword)
                    ).fetchCount();
        }

        if(searchOption.equals("cosname")){
            return queryFactory.selectFrom(courseDomain)
                    .where(courseDomain.cosname.like(keyword)
                    ).fetchCount();
        }


        return queryFactory.selectFrom(courseDomain)
                .where(courseDomain.coscategory1.like(keyword)
                        .or(courseDomain.coscategory2.like(keyword))
                        .or(courseDomain.cosname.like(keyword))
                ).fetchCount();

    }

    @Override
    public List<CourseDomain> myCourse(String userId){
        return queryFactory.selectFrom(courseDomain)
                .where(courseDomain.cosno.in(
                    JPAExpressions.select(subscribeDomain.cosno)
                            .from(subscribeDomain)
                            .where(subscribeDomain.id.eq(userId))
                ))
                .fetch();
    }



}
