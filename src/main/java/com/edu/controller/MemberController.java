package com.edu.controller;

import com.edu.commons.GoogleAuthInfo;
import com.edu.commons.SocialLogin;
import com.edu.domain.Member;
import com.edu.domain.UserDomain;
import com.edu.service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private SocialLogin socialLogin;

	@Autowired
	private GoogleAuthInfo googleAuthInfo;


	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 회원가입 페이지 이동
	@RequestMapping(value ="/memberRegister")
	public String memberRegister() {
		return "member/memberRegister";
	}

	//로그인 페이지로 이동
	@RequestMapping(value="/login")
	public String login(Model model,HttpSession session) {
		String state = UUID.randomUUID().toString();

		OAuth2Parameters googleOAuth2Parameters = new OAuth2Parameters();
		googleOAuth2Parameters.setScope(googleAuthInfo.getScope());
		googleOAuth2Parameters.setRedirectUri(googleAuthInfo.getRedirectUri());

		GoogleOAuth2Template googleOAuth2Template = new GoogleOAuth2Template(googleAuthInfo.getClientId(),googleAuthInfo.getClientSecret());


		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);


		model.addAttribute("state", state);
		model.addAttribute("google_url", url);
		session.setAttribute("state", state);
		

		return "member/login";
	}

	// 회원 수정창 이동
	@RequestMapping(value="/memberUpdateForm")
	public String memberUpdateForm(Model model, Principal principal) throws Exception{

		if(principal == null){
			return "redirect:/error";
		}

		String loginId = principal.getName();

		//사용자 
		UserDomain loginMember = memberService.getMemberById(loginId);

		model.addAttribute("member",loginMember);

		return "member/memberUpdate";
	}

	// 회원 수정
	@RequestMapping("/memberUpdate")
	public String memberUpdate(String u_nick, String u_email1, String u_email2,  Principal principal) throws Exception{

		if(principal == null){
			return "redirect:/error";
		}

		String loginId = principal.getName();

		//사용자
		UserDomain loginMember = memberService.getMemberById(loginId);

		loginMember.setNickname(u_nick);
		loginMember.setEmail(u_email1 + "@" + u_email2);

		try {
			memberService.updateMember(loginMember);
		} catch (Exception e){

		}

		return "redirect:/";
	}

	// 비밀번호 초기화 페이지 이동
	@RequestMapping(value="/resetPassword")
	public String forgot() {
		return "member/resetPassword";
	}


	// 회원가입 처리
	@RequestMapping(value = "/joinResult")
	public String joinResult(Member member, String email1, String email2, HttpSession session) throws Exception{


		member.setEmail(email1 + "@" + email2);
		memberService.joinMember(member);

		UserDomain logindMember =  memberService.getMemberById(member.getId());

		// 회원 가입 후 자동로그인
		session.setAttribute("member", logindMember);
		session.setAttribute("loginId", logindMember.getId());
		session.setAttribute("nickName", logindMember.getNickname());
		session.setAttribute("grade", logindMember.getGrade());

		return "redirect:/";
	}


	// 카카오 로그인
	@RequestMapping(value = "/login/kakaoOauth")
	public String kakaoLoginProcess(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) throws Exception {

		// AccessToken 받기
		JsonNode kakaoAccessToken = socialLogin.getKakaoAccessToken(code);

		// 사용자 프로필 받기
		JsonNode kakaoProfile = socialLogin.getKakaoUserProfile(kakaoAccessToken.path("access_token").toString());


		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> kakaoUserInfo = mapper.readValue(kakaoProfile.toString(), Map.class);

		String id = "kakao_"+kakaoUserInfo.get("id").toString();

		logger.info("카카오 회원 체크 userId: " + id);
		boolean userCheck = memberService.checkUserByUserId(id);

		if (!userCheck) {
			logger.info("기존의 카카오 회원정보가 없으므로 회원가입 진행합니다.");

			// 회원 등록
			memberService.registerMember(kakaoUserInfo, "KAKAO");

			UserDomain loginMember = memberService.getMemberById(id);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNickname());

		} else {
			UserDomain loginMember = memberService.getMemberById(id);

			//기존에 있는 회원이므로 바로 로그인 진행
			logger.info("기존의 카카오 회원정보가 존재합니다. userId: " + id);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNickname());

		}

		return "member/socialLoginPopup";
	}


	// 구글로그인
	@RequestMapping(value = "/login/googleSignInCallback")
	public String googleLoginProcess(HttpServletRequest request, HttpSession session) throws Exception {

		// 로그인을 통해 받은 코드 값
		String code = request.getParameter("code");
		logger.info("구글 로그인 code: " + code);

		SocialLogin socialLogin = new SocialLogin();

		String ClientId = googleAuthInfo.getClientId();
		String ClientSecret = googleAuthInfo.getClientSecret();
		String redirect_uri = googleAuthInfo.getRedirectUri();

		// 구글에서 받은 코드값을 다시 구글에 요청하여 계정 정보 받아오기
		Map<String, String> result = socialLogin.getGoogleAccessToken(code, ClientId, ClientSecret, redirect_uri);

		String userId = "google_"+result.get("sub");

		logger.info("구글 회원 체크 userId: " + userId);
		boolean userCheck = memberService.checkUserByUserId(userId);

		if (!userCheck) {
			logger.info("기존의 구글 회원정보가 없으므로 회원가입 진행합니다.");

			// 회원 등록
			memberService.registerMember(result, "GOOGLE");

			UserDomain loginMember = memberService.getMemberById(userId);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNickname());

		} else {
			UserDomain loginMember = memberService.getMemberById(userId);

			//기존에 있는 회원이므로 바로 로그인 진행
			logger.info("기존의 구글 회원정보가 존재합니다. userID: " + userId);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNickname());

		}

		return "member/socialLoginPopup";

	}


	@RequestMapping(value = "/login/googleSignIn")
	public String googleLoginProcessNew(HttpServletRequest request, HttpSession session, Authentication authentication) throws Exception {

		OAuth2Authentication oAuth2Authentication = (OAuth2Authentication) authentication;
		HashMap resultObject = (HashMap)oAuth2Authentication.getUserAuthentication().getDetails();


		String userId = "google_"+resultObject.get("sub");

		logger.info("구글 회원 체크 userId: " + userId);
		boolean userCheck = memberService.checkUserByUserId(userId);

		if (!userCheck) {
			logger.info("기존의 구글 회원정보가 없으므로 회원가입 진행합니다.");

			// 회원 등록
			memberService.registerMember(resultObject, "GOOGLE");

		} else {

			//기존에 있는 회원이므로 바로 로그인 진행
			logger.info("기존의 구글 회원정보가 존재합니다. userID: " + userId);
		}

		return "member/socialLoginPopup";

	}


}
