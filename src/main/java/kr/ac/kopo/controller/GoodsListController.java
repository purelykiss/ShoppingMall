package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.Review;
import kr.ac.kopo.vo.Search;

public class GoodsListController  implements Controller{
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String keyword = request.getParameter("keyword");
		String gender = request.getParameter("gender");
		String seasonyearStr = request.getParameter("seasonyear");
		String season = request.getParameter("season");
		String maxpriceStr = request.getParameter("maxprice");
		String minpriceStr = request.getParameter("minprice");
		int pagecontents = 9;
		String curpageStr = request.getParameter("curpage"); 
		
		int seasonyear = 0;
		try {
			seasonyear = Integer.parseInt(seasonyearStr);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		int maxprice = 0;
		try {
			maxprice = Integer.parseInt(maxpriceStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int minprice = 0;
		try {
			minprice = Integer.parseInt(minpriceStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int curpage = 1;
		try {
			curpage = Integer.parseInt(curpageStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(curpage <1)
			curpage = 1;
		
		Search search = new Search();
		if(keyword != null) {
			StringTokenizer st = new StringTokenizer(keyword);
			List<String> keywordList = new ArrayList<String>();
			while(st.hasMoreTokens())
				keywordList.add(st.nextToken());
			search.setKeyword(keywordList);
		}
			
		if(gender != null)
		search.setGender(gender);
		if(season != null)
		search.setSeason(season);
		
		search.setSeasonyear(seasonyear);
		search.setPagecontents(pagecontents);
		search.setMaxprice(maxprice);
		search.setMinprice(minprice);
		search.setCurpage(curpage); 

		int maxpage = 1;
		
		GoodsDAO goodsDao = new GoodsDAO();
		
		Search searchCnt = goodsDao.selectSearchCountBySearch(search);
		int tmp = searchCnt.getTotalcontents();
		search.setTotalcontents(tmp);
		
		List<GoodsInfo> selectgoodsInfo = new ArrayList<GoodsInfo>();
		List<GoodsPicture> selectgoodsPicture = new ArrayList<GoodsPicture>();
		if(tmp == 0) {
			//검색결과 없음에 대해
		}else {		//검색결과가 1개이상 있다면
			if(tmp % pagecontents == 0) {
				maxpage = tmp / pagecontents; 
			}else {
				maxpage = tmp / pagecontents +1;
			}
			
			if(curpage > maxpage) {
				curpage = maxpage;
				search.setCurpage(curpage);
			}
			
			selectgoodsInfo = goodsDao.selectGoodsInfoBySearch(search);
			selectgoodsPicture = goodsDao.selectgoodsPictureBySearch(search);
		}
		
		for(GoodsPicture item: selectgoodsPicture) {
			if(item.getPicturepath().charAt(0)=='/') {
				item.setPicturepath(item.getPicturepath().substring(1));
			}
		}
		
		request.setAttribute("search", search);
		request.setAttribute("selectgoodsInfo", selectgoodsInfo);
		request.setAttribute("selectgoodsPicture", selectgoodsPicture);
		request.setAttribute("totalcontents", tmp);
		request.setAttribute("maxpage", maxpage);
		
		return "/goodsList.jsp";
	}
}
