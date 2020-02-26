package com.edu.commons;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailConfirm {
	
	public String connectEmail(String email) {

		final String from="v12v12rb@gmail.com";	//보내는 메일 계정
		final String password = "cotpr123";
		String to1=email;
		String host="smtp.gmail.com";    //smtp 서버


		String subject="NoN 비밀번호 찾기";
		String fromName="NoN";		 //보내는 이름 설정
		String authNum=ranEmail(); // 초기화 비밀번호
		String content="NoN 초기화 비밀번호  :  " +authNum+ " "; // 초기화될 비밀번호 발송

		System.out.println(email); //회원가입 사용자 이메일
		System.out.println(from); //보내는사람이메일
		
			
		//SMTP 이용하기 위해 설정해주는 설정값들
		//smtp 서버 정보 설정
		try {
			Properties props=new Properties(); //정보를 담기위한 객체생성
			props.put("mail.smtp.starttls.enable","true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.soketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "25");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			System.out.println("mailcheck1");
			
			//session 생성
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from,password); //email 계정과 비번입력해
					
				}
			});
			
			System.out.println("mailSession"+new PasswordAuthentication(from,password));
			System.out.println("mailcheck2");
			Message msg= new MimeMessage(mailSession); //mimemessage 생성
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"utf-8","B")));
			msg.setRecipients(Message.RecipientType.TO, address1);//받는 사람 설정
			msg.setSubject(subject); //제목설정
			msg.setSentDate(new java.util.Date());	//보내는 날짜 설정
			msg.setContent(content,"text/html;charset=utf-8");	// 내용 설정
			
			Transport.send(msg); //메일 보내기
			
		}catch(MessagingException e1) {
			e1.printStackTrace();
		}catch(Exception e2) {
			e2.printStackTrace();
		}
		System.out.println("mailcheck3");
		System.out.println(authNum);
		return authNum; //그리고 비교를위해 이 난수를 반환
	}
	
	
	
	
	
	public String ranEmail() {
		String  email = "";
		StringBuffer ran1 = new StringBuffer();
		
		// 대문자 4개를 임의 발생 
//		ran1.append((char)((Math.random() * 26)+65));  // 첫글자는 대문자, 첫글자부터 특수문자 나오면 안 이쁨
		for(int i = 0; i<4; i++) {
		   ran1.append((char)((Math.random() * 26)+65));  // 아스키번호 65(A) 부터 26글자 중에서 택일
		} 

		// 소문자 4개를 임의발생
		for( int i = 0; i<4; i++) {
		    ran1.append((char)((Math.random() * 26)+97)); // 아스키번호 97(a) 부터 26글자 중에서 택일
		}  

		// 숫자 2개를 임의 발생
		for( int i = 0; i<2; i++) {
		    ran1.append((char)((Math.random() * 10)+48)); //아스키번호 48(1) 부터 10글자 중에서 택일
		}
		
		email = ran1.toString();
		return email;
		}
}
		
