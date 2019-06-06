package com.Edu.Dao;

import java.util.List;
import org.apache.ibatis.annotations.Select;

import com.Edu.Domain.Code;

public interface EtcMapper  { 
	@Select (" select * from code where group1 = #{Group} ")
	List<Code> findByGroup(String Group);
	
	List<Code> findByGroupXml(String Group);
}
