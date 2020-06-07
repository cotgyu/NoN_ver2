package com.edu.repository;

import com.edu.domain.CourseDomain;
import com.edu.domain.SubscribeDomain;

import java.util.List;

public interface SubscribeRepositoryCustom {

    SubscribeDomain ajaxCheckSubscribe(int cosNum, String userId);


}
