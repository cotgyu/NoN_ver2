package com.edu.service;

import java.util.ArrayList;
import java.util.Map;

import com.edu.domain.Member;
import com.edu.domain.UserDomain;

public interface MemberService {

	// id로 사용자 정보 가져오기
	UserDomain getMemberById(String id) throws Exception;
	
	//회원가입
	void joinMember(Member member);
	
	//정보수정
	void updateMember(UserDomain member);

	//비밀번호 초기화
	void resetPassword(UserDomain member);


	// Id 체크
	boolean checkUserByUserId(String id);

	//사용자등록
	void registerMember(Map userinfoMap, String loginType);

}
