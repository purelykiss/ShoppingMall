package kr.ac.kopo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.ReceiptDAO;
import kr.ac.kopo.framework.Controller;

public class PurchaseController  implements Controller{
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
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
        	request.setAttribute("message", "로그인이 필요한 작업 입니다.");
    		return "signUpResult.jsp";
        }	//로그인이 안되있으면 index.do로 되돌려보낸다.
		
        //dao생성
        ReceiptDAO receiptDao = new ReceiptDAO();
        
        if(!receiptDao.proceedPurchase(id)) {
        	request.setAttribute("message", "구매하는 동안 문제가 발생했습니다.");
    		return "signUpResult.jsp";
        }
        
        /*
		//돈계산 생략
        
        //상품 재고 확인
    	if(!receiptDao.subtractStockById(id)) {
        	request.setAttribute("message", "상품의 재고 수가 부족합니다.");
        	receiptDao.rollback();
    		return "signUpResult.jsp";
    	}
    	
    	//영수증 발행
    	if(!receiptDao.subtractStockById(id)) {
        	request.setAttribute("message", "영수증 발행에 실패했습니다.");
        	receiptDao.rollback();
    		return "signUpResult.jsp";
    	}
    	
    	//장바구니 비우기
    	if(!receiptDao.subtractStockById(id)) {
        	request.setAttribute("message", "장바구니 비우기를 실패했습니다");
        	receiptDao.rollback();
    		return "signUpResult.jsp";
    	}
		
    	//문제가 없으면 commit시도
    	receiptDao.commit();
    	*/
    	
    	request.setAttribute("message", "상품을 구매하였습니다.");
		return "signUpResult.jsp";
	}
}
