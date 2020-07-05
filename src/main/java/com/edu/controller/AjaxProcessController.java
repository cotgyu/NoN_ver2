package com.edu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.edu.domain.UserDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.commons.EmailConfirm;
import com.edu.service.MemberService;

@Controller
public class AjaxProcessController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/dupleCheck.ajax")
	@ResponseBody
	public String dupleCheck(String id,String nick) throws Exception {
		UserDomain member = null;

		String checkResult = "false";


		if(id != null && nick == null) {

			member = memberService.getMemberById(id);

			if(member == null) {
				checkResult = "true";
			}
		}
		else if(id == null && nick != null) {
			member = memberService.getMemberById(id);
			if(member == null) {
				checkResult = "true";
			}

		}

		return checkResult;
		
	}
	
	@RequestMapping("/resetPassword.ajax")
	@ResponseBody
	public Map<String,String> resetPassword(String email1,String email2, String id) throws Exception{
		String email = null;
		Map<String,String> map = new HashMap<String,String>();
		if(!email1.equals("")||!email2.equals("")) {//email1이 null이 아니거나 email2가 null이 아닐경우
			email = email1+"@"+email2;
		}

		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum = emailconfirm.connectEmail(email);

		// 발송된 비밀번호로 초기화
		UserDomain member = memberService.getMemberById(id);
		member.setPassword(authNum);

		memberService.resetPassword(member);

		return map;
	}

	@RequestMapping("/memberEmailCheck.ajax")
	@ResponseBody
	public Boolean memberEmailCheck(String id,String email, HttpSession session,HttpServletResponse repsonse) throws Exception{
		boolean checkMember = false;

		UserDomain member = memberService.getMemberById(id);
		if(member != null) {
			if(member.getEmail().equals(email)) {

				checkMember = true;

			}
		}
		return checkMember;
	}


	// 로그인 체크 후 로그인
	@RequestMapping("/loginCheck.ajax")
	@ResponseBody
	public Boolean loginCheck(String id, String password, HttpSession session) throws Exception{
		boolean checkMember = false;

		UserDomain member = null;

		member = memberService.getMemberById(id);

		if(member != null) {

			if(member.getId().equals(id) && passwordEncoder.matches(password, member.getPassword())) {

				session.setAttribute("member", member);
				session.setAttribute("loginId", member.getId());
				session.setAttribute("nickName", member.getNickname());
				session.setAttribute("grade", member.getGrade());

				checkMember = true;
			}
		}

		return checkMember;
	}
	
	

}
