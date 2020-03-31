package com.edu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.domain.Member;
import com.edu.commons.EmailConfirm;
import com.edu.service.MemberService;

@Controller
public class AjaxProcessController {
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/dupleCheck.ajax")
	@ResponseBody
	public String dupleCheck(String id,String nick) throws Exception {
		Member member = null;

		String checkResult = "false";


		if(id != null && nick == null) {

			member = memberService.loginCheck(id);

			if(member == null) {
				checkResult = "true";
			}
		}
		else if(id == null && nick != null) {
			member = memberService.idCheck(nick);
			if(member == null) {
				checkResult = "true";
			}

		}

		return checkResult;
		
	}
	
	@RequestMapping("/resetPassword.ajax")
	@ResponseBody
	public Map<String,String> resetPassword(String email1,String email2, String id){
		String email = null;
		Map<String,String> map = new HashMap<String,String>();
		if(!email1.equals("")||!email2.equals("")) {//email1이 null이 아니거나 email2가 null이 아닐경우
			email = email1+"@"+email2;
		}

		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum = emailconfirm.connectEmail(email);

		// 발송된 비밀번호로 초기화
		Member member = memberService.login(id);
		member.setPass(authNum);

		memberService.resetPassword(member);

		return map;
	}

	@RequestMapping("/memberEmailCheck.ajax")
	@ResponseBody
	public Boolean memberEmailCheck(String id,String email, HttpSession session,HttpServletResponse repsonse){
		boolean checkMember = false;

		Member member = memberService.login(id);
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
	public Boolean loginCheck(String id,String password, HttpSession session){
		boolean checkMember = false;

		Member member = null;

		member = memberService.login(id);

		if(member != null) {

		    // 패스워드 비교 수정 필요
			if(member.getId().equals(id)&&member.getPass().equals(password)) {

				session.setAttribute("member", member);
				session.setAttribute("loginId", member.getId());
				session.setAttribute("nickName", member.getNick());
				session.setAttribute("grade", member.getGrade());

				checkMember = true;
			}
		}

		return checkMember;
	}
	
	

}
