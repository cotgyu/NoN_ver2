package com.edu.service;

import java.util.List;
import com.edu.domain.Code;


public interface EtcService {
	List<Code> findByGroup(String group);

	List<Code> findByGroupXml(String group);
}
