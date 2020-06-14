package com.edu.service;

import java.util.ArrayList;
import java.util.Map;

import com.edu.domain.UserDomain;
import com.edu.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public UserDomain getMemberById(String id) throws Exception {

		return memberRepository.findAllById(id);
	}

	@Override
	public void joinMember(Member member) {

		memberRepository.save(UserDomain.builder()
				.id(member.getId())
				.password(member.getPass())
				.nickName(member.getNick())
				.email(member.getEmail())
				.loginType(member.getLogintype())
				.build());
	}

	@Override
	public void updateMember(UserDomain member) {
		memberRepository.save(UserDomain.builder()
				.userNum(member.getUsernum())
				.nickName(member.getNickname())
				.email(member.getEmail())
				.build());

	}

	@Override
	public void resetPassword(UserDomain member) {
		memberRepository.save(UserDomain.builder()
				.password(member.getPassword())
				.build());
	}


	@Override
	public boolean checkUserByUserId(String id) {

		if (memberRepository.findAllById((id)) != null) {
			return true;
		}

		return false;

	}

	@Override
	public void registerMember(Map userInfoMap, String loginType) {

		Member member = new Member();

		if(loginType != null && loginType.length() != 0){
			member.setLogintype(loginType);
		}

		if (loginType.equals("GOOGLE")) {
			member.setId("google_"+(String)userInfoMap.get("sub"));
			member.setNick((String)userInfoMap.get("name"));

		} else if (loginType.equals("KAKAO")) {
			// 닉네임 받기
			Map KakaoProfile = (Map)userInfoMap.get("properties");
			String nickName = (String)KakaoProfile.get("nickname");

			member.setId("kakao_"+userInfoMap.get("id").toString());
			member.setNick(nickName);

		}

		memberRepository.save(UserDomain.builder()
				.id(member.getId())
				.password(member.getPass())
				.nickName(member.getNick())
				.email(member.getEmail())
				.loginType(member.getLogintype())
				.build());

	}


}

