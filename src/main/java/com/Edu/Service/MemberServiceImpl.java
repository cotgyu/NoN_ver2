package com.Edu.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.MemberDaoMapper;
import com.Edu.Domain.Member;
import com.Edu.Service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

/*	@Autowired
	private FacebookConnectionFactory connectionFactory;
	
	@Autowired 
	private OAuth2Parameters oAuth2Parameters;
	*/
	@Autowired
	private MemberDaoMapper memberDaoMapper;

	@Override
	public Member loginCheck(String id) throws Exception {
		System.out.println("서비스에 로긴첵 id = " + id);
		return memberDaoMapper.loginCheck(id);
	}

	@Override
	public Member idCheck(String id) {
		return memberDaoMapper.idCheck(id);
	}

	@Override
	public ArrayList<Member> getMemberList() {
		return null;
	}

	@Override
	public void joinMember(Member member) {
		memberDaoMapper.joinMember(member);
	}

	@Override
	public void Update(Member member) {
		memberDaoMapper.Update(member);
	}

	@Override
	public Member login(String id) {
		System.out.println("ajaxprocess에서 서비스 임플 까지 id pass 넘어옴"+id);
		return memberDaoMapper.login(id);
	}

	@Override
	public void forgotPass(Member member) {
		memberDaoMapper.forgotPass(member);
	}

	@Override
	public void kakaologin(Member member) {
		memberDaoMapper.kakaologin(member);
	}

	@Override
	public void naverlogin(Member member) {
		memberDaoMapper.naverlogin(member);
		// TODO Auto-generated method stub
		
	}



}

