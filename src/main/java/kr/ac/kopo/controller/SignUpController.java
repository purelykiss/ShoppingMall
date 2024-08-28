package kr.ac.kopo.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.UserInfoDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.UserInfo;

public class SignUpController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("signup.do controller");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("username");
		String gender = request.getParameter("gender");
		String emailID = request.getParameter("emailid");
		String emailDomain = request.getParameter("emaildomain");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String homeaddress = request.getParameter("homeaddress");
		String detailaddress = request.getParameter("detailaddress");

		StringBuilder email = new StringBuilder();;
		email.append(emailID).append("@").append(emailDomain);
		
		UserInfoDAO userInfoDao = new UserInfoDAO();
		UserInfo userInfo = new UserInfo();
		
		userInfo.setId(id);
		userInfo.setPassword(password);
		userInfo.setName(name);
		userInfo.setGender(gender);
		userInfo.setEmail(email.toString());
		userInfo.setPhone(phone);
		userInfo.setPostcode(postcode);
		userInfo.setHomeaddress(homeaddress);
		userInfo.setDetailaddress(detailaddress);

		boolean flag = userInfoDao.insertMember(userInfo);
		String message = null;
		if(flag) {
			message = "회원가입이 완료되었습니다!";
		}else {
			message = "오류가 생겼습니다. 다시 이용해주십시오.";
		}
		request.setCharacterEncoding("UTF-8");
        request.setAttribute("message", message);
        
        return "signUpResult.jsp";
	}
	
}
