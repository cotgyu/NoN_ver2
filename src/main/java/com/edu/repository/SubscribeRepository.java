package com.edu.repository;

import com.edu.domain.SubscribeDomain;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubscribeRepository extends JpaRepository<SubscribeDomain, Long>, SubscribeRepositoryCustom {


    SubscribeDomain findByCosnoAndId(int cosno, String id);
}
