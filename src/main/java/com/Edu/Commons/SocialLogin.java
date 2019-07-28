package com.Edu.Commons;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Component
public class SocialLogin {

    @Value("${kakao.client.clientId}")
    private String kakaoClientId;

    @Value("${kakao.client.redirectUri}")
    private String redirectUri;




    //카카오로부터 AccessToken 받기
    public JsonNode getKakaoAccessToken(String code) {

        final String RequestUrl = "https://kauth.kakao.com/oauth/token";

        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();


        //포스트 파라미터의 grant_type이라는 명칭에 authorization_code를 추가한다 아래도 동일
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", kakaoClientId));
        postParams.add(new BasicNameValuePair("redirect_uri", redirectUri));
        postParams.add(new BasicNameValuePair("code", code));

        final HttpClient client = HttpClientBuilder.create().build();

        final HttpPost post = new HttpPost(RequestUrl);

        JsonNode returnNode = null;

        try {

            post.setEntity(new UrlEncodedFormEntity(postParams));

            final HttpResponse response = client.execute(post);

            ObjectMapper mapper = new ObjectMapper();

            returnNode = mapper.readTree(response.getEntity().getContent());

        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();

        } catch (ClientProtocolException e) {

            e.printStackTrace();

        } catch (IOException e) {

            e.printStackTrace();

        } finally {

        }

        return returnNode;

    }

    // 받은 토큰을 통해 카카오로 부터 사용자 프로필 받기
    public JsonNode getKakaoUserProfile(String access_token) {

        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);

        post.addHeader("Authorization", "Bearer " + access_token);

        JsonNode returnNode = null;

        try {
            final HttpResponse response = client.execute(post);

            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

        }

        return returnNode;

    }



    // 받은 코드를 통해 구글로부터 사용자 토큰(프로필) 받기
    public Map getGoogleAccessToken(String code, String CliendId, String ClientSecret, String redirect_uri) throws Exception{

        // 구글로그인을 통해 받은 정보로 access token 얻기
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", CliendId);
        parameters.add("client_secret", ClientSecret);
        parameters.add("redirect_uri", redirect_uri);
        parameters.add("grant_type", "authorization_code");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();


        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));

        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> result = mapper.readValue(body, Map.class);


        /*
        넘어온 json 값들 설명
        https://developers.google.com/identity/protocols/OpenIDConnect

        iss : 로그인 구분 값
        sub : userId
         */

        return result;
    }
}
