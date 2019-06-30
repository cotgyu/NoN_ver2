package com.Edu.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Edu.Domain.Member;
import com.Edu.Function.EmailConfirm;
import com.Edu.Service.MemberService;

@Controller
public class AjaxProcessController {
	
	@Autowired
	private MemberService memberService;
	
	/*@Autowired
	public Member member;
	*/
	
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
	
	@RequestMapping("/emailCheck.ajax")
	@ResponseBody
	public Map<String,String> emailCheck(String email1,String email2){
		String email = null;
		Map<String,String> map = new HashMap<String,String>();
		if(!email1.equals("")||!email2.equals("")) {//email1이 null이 아니거나 email2가 null이 아닐경우
			email = email1+"@"+email2;
		}
		else {
			System.out.println("ajax EmailCheck error");
		}
		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum=emailconfirm.connectEmail(email);
		map.put("authNum", authNum);
		System.out.println("이메일 인증 발송 완료  key값 : " + authNum);
		return map;
	}
	
	//용도:비밀번호찾기,로그인ajax부분
	@RequestMapping("/forgotPass.ajax")
	@ResponseBody
	public Member forgotPass(String id,String pass, HttpSession session,HttpServletResponse repsonse){
		Member member = null;
		System.out.println("여길오긴오나??");
		
		member = memberService.login(id);
		if(member !=null) {
			if(member.getId().equals(id)&&member.getPass().equals(pass)) {
				
				//session.setAttribute("isLogin", true);
				session.setAttribute("member", member);
				session.setAttribute("id", member.getId());			
				session.setAttribute("nick", member.getNick());
				session.setAttribute("grade", member.getGrade());
				//System.out.println("로그인성공 id = "+ id + "비밀번호 = " + pass);
				//System.out.println(session.getAttribute("isLogin"));
				//System.out.println(session.getAttribute("nick"));
				System.out.println("AJAXPROCE"+session.getAttribute("state"));
			}
		}
		else {
			System.out.println("포갓패스 실패");
		}
		return member;
	}
	
	

}
