package com.edu.security;

import com.edu.common.BaseControllerTest;
import org.junit.Test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class SecurityTest extends BaseControllerTest {

    @Test
    public void googleSingInTest () throws Exception {

        //When && Then
        mockMvc.perform(get("/login/googleSignInCallback")

        )
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrlPattern("https://accounts.google.com/o/oauth2/**"))


        ;

    }
}
