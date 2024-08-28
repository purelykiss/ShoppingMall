package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.dao.UserInfoDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.UserInfo;
import kr.ac.kopo.vo.Review;

public class CheckUserIdController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		String id = request.getParameter("id");
		UserInfoDAO memberDao = new UserInfoDAO();
        boolean isAvailable = false;
        UserInfo member = memberDao.selectMemberById(id);
        isAvailable = (member == null);

        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if(isAvailable) {
            out.print("사용가능한 아이디입니다.");
        } else {
            out.print("중복된 아이디가 있습니다.");
        }
        out.flush();
        out.close();
        
        // AJAX 요청이므로 JSP 페이지로 포워드하지 않음
        return null;
	}
	
}