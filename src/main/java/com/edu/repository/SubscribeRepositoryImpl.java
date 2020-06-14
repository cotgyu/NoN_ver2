package com.edu.repository;

import com.edu.domain.SubscribeDomain;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;

import static com.edu.domain.QSubscribeDomain.subscribeDomain;

@RequiredArgsConstructor
public class SubscribeRepositoryImpl implements SubscribeRepositoryCustom {

    private final JPAQueryFactory queryFactory;

    public SubscribeDomain ajaxCheckSubscribe(int cosNum, String userId){
        return queryFactory.selectFrom(subscribeDomain)
                .where(subscribeDomain.cosno.eq(cosNum)
                        .and(subscribeDomain.id.eq(userId)))
                .fetchOne();
    }



}
