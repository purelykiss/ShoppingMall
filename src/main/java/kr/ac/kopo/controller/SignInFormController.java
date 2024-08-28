package kr.ac.kopo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.framework.Controller;

public class SignInFormController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        boolean flagIsSignnedin = false;
		
        String cookieCheck = request.getHeader("Cookie");
        if(cookieCheck != null) {
        	Cookie[] cookies = request.getCookies();
            for(Cookie cookie : cookies) {	//shopping / 아이디
            	if(cookie.getName().compareTo("shopping") == 0)
            		flagIsSignnedin = true;	
            }
        }
        
        
        if(!flagIsSignnedin)
        	return "signInForm.jsp";
        else {
        	request.setCharacterEncoding("utf-8");
        	request.setAttribute("message", "이미 로그인 했습니다!");
        	return "signUpResult.jsp";
        }
	}
	
}
