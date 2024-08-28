package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.UserInfoDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.UserInfo;

public class SignInController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		System.out.println("로그인 시도");
        PrintWriter out = response.getWriter();
		
        //로그인 중첩 탐지
		boolean flagIsSignnedin = false;
		
        String cookieCheck = request.getHeader("Cookie");
        if(cookieCheck != null) {
        	Cookie[] cookies = request.getCookies();
            for(Cookie cookie : cookies) {	//shopping / 아이디
            	if(cookie.getName().compareTo("shopping") == 0)
            		flagIsSignnedin = true;	
            }
        }
		
        if(flagIsSignnedin) {
        	out.print("3");
            out.flush();
            out.close();
    		return null;
        }	//미리 로그인을 했는지 체크해서 맞다면 로그인 중첩을 막음
        
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserInfo member = new UserInfo();
		
		member.setId(id);
		member.setPassword(password);
		
		UserInfoDAO memberDao = new UserInfoDAO();

        int result =  memberDao.checkMember(member);
        boolean flag = result > 0;
        
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(flag) {
            out.print("1");	//로그인 성공
            request.setCharacterEncoding("utf-8");

        	String cName = "shopping";
        	String cValue = request.getParameter("id");
        	
        	//encoding
        	cName = URLEncoder.encode(cName, "utf-8");
        	cValue = URLEncoder.encode(cValue, "utf-8");
        	
        	//쿠키생성
        	Cookie cookie = new Cookie(cName, cValue);
        	
        	//쿠키전송 (응답객체)
        	response.addCookie(cookie);
        } else {
            out.print("2"); //로그인 실패
        }
        out.flush();
        out.close();
		return null;
	}
	
}
