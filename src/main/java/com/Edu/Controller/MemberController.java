package com.Edu.Controller;

import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.Edu.Domain.Member;
import com.Edu.Function.KakaoLogin;
import com.Edu.Function.NaverLogin;
import com.Edu.Service.MemberService;
import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;


	// 회원가입 폼 이동
	@RequestMapping(value ="/m_register")
	public String register() {
		return "member/register";
	}

	//로그인 페이지로 이동
	@RequestMapping(value="/login")
	public String login(Model model,HttpSession session) {
		String state = UUID.randomUUID().toString();

		model.addAttribute("state", state);
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

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {

		JsonNode token = KakaoLogin.getAccessToken(code);//토큰정보 갖고오는??
		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());//프로필정보 갖고온다??
		Member member = KakaoLogin.changeData(profile);
		Member member1 = null;
		
		member.setId("kakao_" + member.getId());//멤버변수에 아이디 닉 이메일 값 설정
		member.setNick("kakao_" + member.getNick());
		member.setEmail("kakao_"+member.getEmail());
		
		session.setAttribute("member", member);//멤버객체 세션에 저장		
		System.out.println(member);
		session.setAttribute("id", member.getId());//멤버객체id 세선에 저장
		String id = (String) session.getAttribute("id");//세션에 저장된 id값으로 ..
		
		member1 = memberService.idCheck(id);//
		if(member1 != null) {
			System.out.println("중복된 사용자");
			return "redirect:/";
		}
		memberService.kakaologin(member);
		return "redirect:/";
	}
	

	
	@RequestMapping(value = "/naverlogin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(@RequestParam("code") String code,String state, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
			
		JsonNode token = NaverLogin.getAccessToken(code,state,session);
		System.out.println(token);
		System.out.println("token:" + token.path("access_token").toString());
		JsonNode profile = NaverLogin.getNaveroUserInfo(token.path("access_token").toString());
		System.out.println("memberController 안의 profile : " + profile);
		System.out.println("memberController 안의 profile.path : " + profile.path("response").path("id").asText());
		Member member = NaverLogin.changeData(profile);
		Member member1 = null;
		System.out.println("member id : " + member.getId());
		member.setId("naver_" + member.getId());
		member.setNick("naver_" + member.getNick());

		session.setAttribute("member", member);
		session.setAttribute("isLogin", true);
		session.setAttribute("nick", member.getNick());
		session.setAttribute("isSns", true);
		
		session.setAttribute("id", member.getId());
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		member1 = memberService.idCheck(id);
		if(member1 != null) {
			System.out.println("중복된 사용자");
			return "redirect:/";
		}
		memberService.naverlogin(member);
		return "redirect:/";
	}


}
