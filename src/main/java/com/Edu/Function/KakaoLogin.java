package com.Edu.Function;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.Edu.Domain.Member;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoLogin {
	public static JsonNode getAccessToken(String autorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

		//NameValuePair는 HttpClient의 인터페이스(post방식)
		//NameValuePair 클래스의 목적은 1개의 데이터를 전달하기 위한것이므로 name/value값 하나만 저장하는 구조로 되어있다.
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "8fb66d14386ea24cbcd23712d1164091")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/kakaologin")); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
	
		final HttpClient client = HttpClientBuilder.create().build(); //요청 주체
		final HttpPost post = new HttpPost(RequestUrl);
		JsonNode returnNode = null;

		try {
			//UrlEncodedFormEntity는 key/value로 넣어주는것
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			
			final int responseCode = response.getStatusLine().getStatusCode();
			
			//System.out.println("\nSending 'POST' request to URL : " + RequestUrl);//https://kauth.kakao.com/oauth/token
			//System.out.println("Post parameters : " + postParams);// [grant_type=authorization_code, client_id=8fb66d14386ea24cbcd23712d1164091, redirect_uri=http://localhost:8080/kakaologin, code=AqqPHzOvR0NSqCS6S_RKXpWf9lcnJm5vhJQjDodXHAaApw0nwCZsPFUcH-nks9ECNByZcQopdkgAAAFjm1dIYw]
			//System.out.println("Response Code : " + responseCode);//200

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(String autorize_code) {

		final String RequestUrl = "https://kapi.kakao.com/v1/user/me";

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			//System.out.println("\nSending 'POST' request to URL : " + RequestUrl);//https://kapi.kakao.com/v1/user/me
			//System.out.println("Response Code : " + responseCode);//200

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		System.out.println("getkakaouser 메소드안에서 node를 리턴합니다 : " + returnNode);
		return returnNode;
		//returnNode내용
		// {"kaccount_email":"hyodg90@hanmail.net","kaccount_email_verified":true,"id":781346367,"properties":{"profile_image":"http://k.kakaocdn.net/dn/AV3KW/btqlSf48chQ/FfKkQUBFr7DvhzPsdbBke1/profile_640x640s.jpg","nickname":"효동","thumbnail_image":"http://k.kakaocdn.net/dn/AV3KW/btqlSf48chQ/FfKkQUBFr7DvhzPsdbBke1/profile_110x110c.jpg"}}
	}

	public static Member changeData(JsonNode userInfo) {//userInfo에는 profile값이 들어온다.
		Member member = new Member();

		member.setId(userInfo.path("id").asText()); // id -> vo 넣기

		if (userInfo.path("kaccount_email_verified").asText().equals("true")) { // 이메일 받기 허용 한 경우
			member.setEmail(userInfo.path("kaccount_email").asText()); // email -> vo 넣기

		} else { // 이메일 거부 할 경우 코드 추후 개발

		}

		JsonNode properties = userInfo.path("properties"); // 추가정보 받아오기
		if (properties.has("nickname"))
			member.setNick(properties.path("nickname").asText());
			member.setProfile_image(properties.path("thumbnail_image").asText());
		return member;
	}
}