package com.Edu.Controller;

import com.Edu.Commons.GoogleAuthInfo;
import com.Edu.Commons.SocialLogin;
import com.Edu.Domain.Member;
import com.Edu.Service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

	// 회원가입 폼 이동
	@RequestMapping(value ="/m_register")
	public String register() {
		return "member/register";
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

	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {
		session.removeAttribute("member");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/m_update")
	public String update() {
		return "member/m_update";
	}

	@RequestMapping(value="/forgotPasswordForm")
	public String forgot() {
		return "member/forgotPasswordForm";
	}

	@RequestMapping(value="/main")
	public String goMain() {
		return "main";
	}

	@RequestMapping(value = "/joinResult")
	public String joinResult(Member member, String email1, String email2, HttpSession session) {


		member.setEmail(email1 + "@" + email2);
		memberService.joinMember(member);

		// 회원 가입 후 자동로그인
		session.setAttribute("member", member);

		return "redirect:/";
	}


	@RequestMapping("/updateResult")
	public String m_update(Member member, String u_name, String u_nick, String u_email1, String u_email2,
			String u_birth1, String u_birth2, String u_birth3, String u_zipCode, String u_address1, String u_address2,
			String u_mobile1, String u_mobile2, String u_mobile3, String u_gender, String u_emailGet, String u_phone1,
			String u_phone2, String u_phone3, HttpSession session) {

		Member s_member = null;
		s_member = (Member) session.getAttribute("member");

		member.setId(s_member.getId());
		member.setName(u_name);
		member.setNick(u_nick);
		member.setEmail(u_email1 + "@" + u_email2);
		member.setBirth(u_birth1 + "/" + u_birth2 + "/" + u_birth3);
		member.setZipcode(u_zipCode);
		member.setAddress1(u_address1);
		member.setAddress2(u_address2);
		member.setMobile(u_mobile1 + "-" + u_mobile2 + "-" + u_mobile3);
		member.setGender(u_gender);
		member.setPhone(u_phone1 + "-" + u_phone2 + "-" + u_phone3);
		member.setEmailGet(Boolean.valueOf(u_emailGet));

		System.out.println(member.getId() + member.getName() + member.getNick() + member.getNick());
		memberService.Update(member);
		return "redirect:main";
	}

	@RequestMapping("/ForgotPasswordResult")
	public String ForgotPassword(Member member, String id, String pass) {
		member.setId(id);
		member.setPass(pass);
		memberService.forgotPass(member);
		return "redirect:main";
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

			Member loginMember = memberService.login(id);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNick());

		} else {
			Member loginMember = memberService.loginCheck(id);

			//기존에 있는 회원이므로 바로 로그인 진행
			logger.info("기존의 카카오 회원정보가 존재합니다. userId: " + id);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNick());

		}

		return "redirect:/";
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

			Member loginMember = memberService.login(userId);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNick());

		} else {
			Member loginMember = memberService.loginCheck(userId);

			//기존에 있는 회원이므로 바로 로그인 진행
			logger.info("기존의 구글 회원정보가 존재합니다. userID: " + userId);

			session.setAttribute("member", loginMember);
			session.setAttribute("loginId", loginMember.getId());
			session.setAttribute("nickName", loginMember.getNick());

		}

		return "redirect:/";

	}


}
