package com.Edu.Dao;

import java.util.ArrayList;

import com.Edu.Domain.Member;

public interface MemberDaoMapper {

	public Member loginCheck(String id) throws Exception;

	// 닉네임 중복 체크
	public Member idCheck(String nick);

	// 멤버리스트 받아오기
	public ArrayList<Member> getMemberList();

	// 회원가입
	public void joinMember(Member member); //여기서 에러나는데..........................

	// 정보수정
	public void Update(Member member);

	// 비밀번호찾기에서 id값 받아서 이메일인증하기 로그인할때도 이거쓰자... ajax이용.
	public Member login(String id);

	// 비밀번호 찾기
	public void forgotPass(Member member);

	// 카카오로그인
	public void kakaologin(Member member);

	// 네이버로그인
	public void naverlogin(Member member);


}
