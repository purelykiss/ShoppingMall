package kr.ac.kopo.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.dao.UserInfoDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.BasketItem;
import kr.ac.kopo.vo.UserInfo;

public class DeleteBasketItemController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		System.out.println("장바구니 지우기 시도");
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
        
        //로그인 확인
		boolean flagIsSignnedin = false;
		String id = "";
		
        String cookieCheck = request.getHeader("Cookie");
        if(cookieCheck != null) {
        	Cookie[] cookies = request.getCookies();
            for(Cookie cookie : cookies) {	//shopping / 아이디
            	if(cookie.getName().compareTo("shopping") == 0) {
            		flagIsSignnedin = true;	
            		id = cookie.getValue();
            	}
            }
        }
		
        if(!flagIsSignnedin) {
        	return "basketList.do";
        }	//로그인이 필요한 작업이므로 확인한다.
        
		Object basketitemcode = request.getParameter("basketitemcode");
		Object deleteAll = request.getParameter("deleteAll");
		
		BasketItem basketitem = new BasketItem();
		
		basketitem.setId(id);
		if(basketitemcode != null)
			basketitem.setBasketitemcode((String)basketitemcode);
		
		GoodsDAO goodsDao = new GoodsDAO();
		
        boolean flagSucceed = false;
        if(deleteAll != null && deleteAll.equals("1")) {
        	flagSucceed = goodsDao.deleteBasketItemById(id);
        }else{
        	flagSucceed = goodsDao.deleteBasketItemByCode(basketitem);
        }
        
		return "basketList.do";
	}
	
}
