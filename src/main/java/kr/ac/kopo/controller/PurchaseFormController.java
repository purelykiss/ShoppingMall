package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.BasketItem;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.Search;

public class PurchaseFormController  implements Controller{
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
        	request.setAttribute("message", "로그인이 필요한 페이지 입니다.");
    		return "signUpResult.jsp";
        }	//로그인이 안되있으면 index.do로 되돌려보낸다.
		
		int pagecontents = 1000;
		
		int curpage = 1;	//한 페이지에 전부 출력할 것임

		GoodsDAO goodsDao = new GoodsDAO();
		
		Search search = new Search();

		search.setPagecontents(pagecontents);
		search.setCurpage(curpage); 
		search.setId(id);
		
		search.setTotalcontents(goodsDao.selectBasketItemCountBySearch(search).getTotalcontents());
		
		List<BasketItem> selectBasketItem = new ArrayList<BasketItem>();
		List<GoodsInfo> selectgoodsInfo = new ArrayList<GoodsInfo>();
		int selectgoodsPrice = 0;
		if(search.getTotalcontents() == 0) {
        	request.setAttribute("message", "결제할 상품이 존재하지 않습니다.");
    		return "signUpResult.jsp";
		}else {		//검색결과가 1개이상 있다면
			if(search.getTotalcontents() > pagecontents) {	//기존에 dao에 있는 함수로 한페이지에 전부 넣기 위함
				pagecontents = search.getTotalcontents();
				search.setPagecontents(pagecontents);
			}
			selectBasketItem = goodsDao.selectBasketItemBySearch(search);
			selectgoodsInfo = goodsDao.selectgoodsInfoByBasketById(search);
			selectgoodsPrice = goodsDao.selectgoodsPriceByBasketById(id);
		}
		
		request.setAttribute("search", search);
		request.setAttribute("selectBasketItem", selectBasketItem);
		request.setAttribute("selectgoodsInfo", selectgoodsInfo);
		request.setAttribute("selectgoodsPrice", selectgoodsPrice);
		
		return "/purchaseForm.jsp";
	}
}