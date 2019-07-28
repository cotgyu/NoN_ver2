package com.Edu.Commons;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class GoogleAuthInfo {
    @Value("${google.client.clientId}")
    private String clientId;
    @Value("${google.client.clientSecret}")
    private String clientSecret;

    @Value("${google.client.accessTokenUri}")
    private String accessTokenUri;

    @Value("${google.client.userAuthorizationUri}")
    private String userAuthorizationUri;

    @Value("${google.client.clientAuthenticationScheme}")
    private String clientAuthenticationScheme;

    @Value("${google.client.scope}")
    private String scope;

    @Value("${google.client.redirectUri}")
    private String redirectUri;


    public String getClientId() {
        return clientId;
    }


    public String getClientSecret() {
        return clientSecret;
    }

    public String getAccessTokenUri() {
        return accessTokenUri;
    }

    public String getUserAuthorizationUri() {
        return userAuthorizationUri;
    }

    public String getClientAuthenticationScheme() {
        return clientAuthenticationScheme;
    }

    public String getScope() {
        return scope;
    }

    public String getRedirectUri() {
        return redirectUri;
    }
}
