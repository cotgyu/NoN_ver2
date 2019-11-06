package com.Edu.Service;

import java.util.ArrayList;
import java.util.Map;

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
	public void updateMember(Member member) {
		memberDaoMapper.updateMember(member);
	}

	@Override
	public void resetPassword(Member member) {
		memberDaoMapper.resetPassword(member);
	}


	@Override
	public Member login(String id) {
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

	@Override
	public boolean checkUserByUserId(String id) {

		if (memberDaoMapper.idCheck((id)) != null) {
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

		memberDaoMapper.joinMember(member);



	}


}

