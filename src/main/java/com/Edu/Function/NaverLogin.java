package com.Edu.Function;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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

public class NaverLogin {
	
/*	public static HttpResponse goNaverUrl(HttpSession session) throws ClientProtocolException, IOException {
		final String requestUrl = "https://nid.naver.com/oauth2.0/authorize";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);

		postParams.add(new BasicNameValuePair("client_id","BrtJhpWcwgKwdYd5F5xJ"));
		postParams.add(new BasicNameValuePair("response_type","code"));
		postParams.add(new BasicNameValuePair("state",state));
		postParams.add(new BasicNameValuePair("redirect_uri","http://localhost:8080/project02/naverlogin"));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(requestUrl);
		final HttpResponse response = client.execute(post);
		return response;
		
	}
	*/
	
	
	public static JsonNode getAccessToken(String autorize_code,String state,HttpSession session) {
		final String requestUrl = "https://nid.naver.com/oauth2.0/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		if(state.equals((String)session.getAttribute("state"))) {
			postParams.add(new BasicNameValuePair("grant_type","authorization_code"));
			postParams.add(new BasicNameValuePair("client_id","ZxrHN8MDPizObABcEu_r"));
			postParams.add(new BasicNameValuePair("client_secret","O1oR3F1PJi"));
			postParams.add(new BasicNameValuePair("state",state));
			postParams.add(new BasicNameValuePair("code",autorize_code));
			System.out.println("state 값 이프문안으로 들어옵니다.");
			System.out.println("(getAccessToken) autorize_code : " + autorize_code);
			System.out.println("(getAccessToken) state : : " + state);
			final HttpClient client = HttpClientBuilder.create().build();
			final HttpPost post = new HttpPost(requestUrl);
			JsonNode returnNode = null;
			
			try {
				post.setEntity(new UrlEncodedFormEntity(postParams));
				final HttpResponse response = client.execute(post);
				final int responseCode = response.getStatusLine().getStatusCode();
/*				HttpEntity entity = response.getEntity();
				String responseBody = EntityUtils.toString(entity);
							
				System.out.println("(getAccessToken 안에 responseBody : ) : " + responseBody.toString());*/
				System.out.println("(getAccessToken 안에 response : ) : " + response);
				System.out.println("\nSending 'POST' request to URL : " + requestUrl);
				System.out.println("Post parameters : " + postParams);
				System.out.println("Response Code : " + responseCode);
				
				//JSON 형태 반환값 처리
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
			System.out.println("노드를 리턴합니다."+ returnNode);
			return returnNode;
		}
		else {
			System.out.println("state 값 오류");
			return null;
		}
		
		
	}
	
	public static JsonNode getNaveroUserInfo(String autorize_code) {
		final String RequestUrl = "https://openapi.naver.com/v1/nid/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		post.addHeader("Authorization","Bearer " + autorize_code);
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
		
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);
			//JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		System.out.println("getnaveruser 메소드안에서 node를 리턴합니다 : " + returnNode);
		return returnNode;
	}
	
	public static Member changeData(JsonNode userInfo) {
		Member member =new Member();
				
		member.setId(userInfo.path("response").path("id").asText());
		member.setEmail(userInfo.path("response").path("email").asText());
		member.setNick(userInfo.path("response").path("nickname").asText());
		member.setGender(userInfo.path("response").path("gender").asText());
		member.setBirth(userInfo.path("response").path("birthday").asText());
		member.setName(userInfo.path("response").path("name").asText());
		member.setProfile_image(userInfo.path("response").path("profile_image").asText());
		return member;
	}
	



}
