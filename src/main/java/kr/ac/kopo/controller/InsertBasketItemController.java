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

public class InsertBasketItemController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
		System.out.println("장바구니 넣기 시도");
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		
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
        	out.print("3");
            out.flush();
            out.close();
    		return null;
        }	//로그인이 필요한 작업이므로 확인한다.
        
		String sellcode = request.getParameter("sellcode");
		String amountStr = request.getParameter("amount");
		int amount = 0;
		try {
			amount = Integer.parseInt(amountStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BasketItem basketitem = new BasketItem();
		
		basketitem.setId(id);
		basketitem.setSellcode(sellcode);
		basketitem.setPurchasequantity(amount);
		
		GoodsDAO goodsDao = new GoodsDAO();
		StringBuilder tmp = new StringBuilder();
		for(int i = sellcode.length(); i<10; i++){
			tmp.append("0");
		}
		tmp.append(sellcode);
		
		//장바구니 품목 중복 체크
		List<BasketItem> list = goodsDao.selectBasketItemById(id);
		boolean flagExist = false;
		for(var item : list) {
			if(item.getSellcode().compareTo(tmp.toString()) == 0) {
				flagExist = true;
				break;
			}
		}
		if(flagExist) {
			out.print("2");	//장바구니 품목 중복
	        out.flush();
	        out.close();
			return null;
		}
		
        boolean flagSucceed =  goodsDao.insertBasketItem(basketitem);
        
        
        if(flagSucceed) {
            out.print("1");	//장바구니 담기 성공
        } else {
            out.print("4"); //장바구니 담기 오류
        }
        out.flush();
        out.close();
		return null;
	}
	
}
