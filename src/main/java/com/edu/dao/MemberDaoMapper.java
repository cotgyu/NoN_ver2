package com.edu.dao;

import java.util.ArrayList;

import com.edu.domain.Member;

public interface MemberDaoMapper {

	public Member loginCheck(String id) throws Exception;

	// 닉네임 중복 체크
	public Member idCheck(String nick);

	// 멤버리스트 받아오기
	public ArrayList<Member> getMemberList();

	// 회원가입
	public void joinMember(Member member);

	// 정보수정
	public void updateMember(Member member);

	// 비밀번호 초기화
	public void resetPassword(Member member);


	public Member login(String id);

	// 비밀번호 찾기
	public void forgotPass(Member member);

	// 카카오로그인
	public void kakaologin(Member member);

	// 네이버로그인
	public void naverlogin(Member member);


}
