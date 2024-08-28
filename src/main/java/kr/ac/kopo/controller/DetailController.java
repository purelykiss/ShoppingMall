package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.Review;

public class DetailController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object tmp = request.getParameter("id");
		String input = "";
		if(tmp == null){
			System.out.println("request not arrived at DetailController");
		}else {
			input = (String)tmp;
		}
		
		GoodsDAO goodsDao = new GoodsDAO();
		
		GoodsInfo selectgoodsInfo = goodsDao.selectGoodsInfoById(input);
		List<GoodsPicture> selectgoodsPicture = goodsDao.selectGoodsPictureById(input);
		List<Review> selectReview = goodsDao.selectReviewBySellcode(input); 
		
		if(selectgoodsInfo == null) {
			System.out.println("Wrong SellCode");
		}

		for(GoodsPicture item: selectgoodsPicture) {
			if(item.getPicturepath().charAt(0)=='/') {
				item.setPicturepath(item.getPicturepath().substring(1));
			}
		}
		
		request.setAttribute("selectgoodsInfo", selectgoodsInfo);
		request.setAttribute("selectgoodsPicture", selectgoodsPicture);
		request.setAttribute("selectReview", selectReview);	
		
		return "/detail.jsp";
	}
	
}