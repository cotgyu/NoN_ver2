package com.edu.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.EtcMapper;
import com.edu.domain.Code;

@Service
public class EtcServiceImpl implements EtcService { 
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private EtcMapper etcDao;

	@Override
	public List<Code> findByGroup(String group) {
		return etcDao.findByGroup(group); 
	}
	
	@Override
	public List<Code> findByGroupXml(String group) {
		return etcDao.findByGroupXml(group); 
	}
}