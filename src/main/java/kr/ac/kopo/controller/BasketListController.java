package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.BasketItem;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.Search;

public class BasketListController  implements Controller{
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
		
		int pagecontents = 10;
		String curpageStr = request.getParameter("curpage"); 
		
		int curpage = 1;
		try {
			curpage = Integer.parseInt(curpageStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(curpage <1)
			curpage = 1;

		GoodsDAO goodsDao = new GoodsDAO();
		
		Search search = new Search();

		search.setPagecontents(pagecontents);
		search.setCurpage(curpage); 
		search.setId(id);
		
		search.setTotalcontents(goodsDao.selectBasketItemCountBySearch(search).getTotalcontents());

		int maxpage = 1;
		
		List<BasketItem> selectBasketItem = new ArrayList<BasketItem>();
		List<GoodsInfo> selectgoodsInfo = new ArrayList<GoodsInfo>();
		List<GoodsPicture> selectgoodsPicture = new ArrayList<GoodsPicture>();
		int selectgoodsPrice = 0;
		if(search.getTotalcontents() == 0) {
			//검색결과 없음에 대해
		}else {		//검색결과가 1개이상 있다면
			if(search.getTotalcontents() % pagecontents == 0) {
				maxpage = search.getTotalcontents() / pagecontents; 
			}else {
				maxpage = search.getTotalcontents() / pagecontents +1;
			}
			
			if(curpage > maxpage) {
				curpage = maxpage;
				search.setCurpage(curpage);
			}
			selectBasketItem = goodsDao.selectBasketItemBySearch(search);
			selectgoodsInfo = goodsDao.selectgoodsInfoByBasketById(search);
			selectgoodsPicture = goodsDao.selectgoodsPictureByBasketById(search);
			selectgoodsPrice = goodsDao.selectgoodsPriceByBasketById(id);
		}
		
		request.setAttribute("search", search);
		request.setAttribute("selectBasketItem", selectBasketItem);
		request.setAttribute("selectgoodsInfo", selectgoodsInfo);
		request.setAttribute("selectgoodsPicture", selectgoodsPicture);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("selectgoodsPrice", selectgoodsPrice);
		
		return "/basketList.jsp";
	}
}
