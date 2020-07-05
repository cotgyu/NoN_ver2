package com.edu.service;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

import com.edu.domain.Member;
import com.edu.domain.UserDomain;
import com.edu.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public UserDomain getMemberById(String id) throws Exception {

		return memberRepository.findAllById(id);
	}


	public void joinMember(Member member) {

		memberRepository.save(UserDomain.builder()
				.id(member.getId())
				.password(passwordEncoder.encode(member.getPass()))
				.nickName(member.getNick())
				.email(member.getEmail())
				.loginType(member.getLogintype())
				.build());
	}


	public void updateMember(UserDomain member) {
		memberRepository.save(UserDomain.builder()
				.userNum(member.getUsernum())
				.nickName(member.getNickname())
				.email(member.getEmail())
				.build());

	}


	public void resetPassword(UserDomain member) {
		memberRepository.save(UserDomain.builder()
				.password(passwordEncoder.encode(member.getPassword()))
				.build());
	}



	public boolean checkUserByUserId(String id) {

		if (memberRepository.findAllById((id)) != null) {
			return true;
		}

		return false;

	}


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
				.password(passwordEncoder.encode(member.getPass()))
				.nickName(member.getNick())
				.email(member.getEmail())
				.loginType(member.getLogintype())
				.build());

	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDomain userById = memberRepository.findAllById(username);

		return new User(userById.getId(), userById.getPassword(), authorities(userById.getGrade()));
	}

	private Collection<? extends GrantedAuthority> authorities(int grade) {

		String role = "ROLE_USER";

		if(grade == 4){
			role = "ROLE_ADMIN";
		}

		return Arrays.asList(new SimpleGrantedAuthority(role));
	}
}
