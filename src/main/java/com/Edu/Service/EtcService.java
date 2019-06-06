package com.Edu.Service;

import java.util.List;
import com.Edu.Domain.Code;


public interface EtcService {
	List<Code> findByGroup(String group);

	List<Code> findByGroupXml(String group);
}
