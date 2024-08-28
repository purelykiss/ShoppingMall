package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.GoodsDAO;
import kr.ac.kopo.framework.Controller;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;

public class IndexController  implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		GoodsDAO goodsDao = new GoodsDAO();
		
		List<GoodsInfo> goodsMale = goodsDao.selectGoodsInfo4Male();
		request.setAttribute("goodsMale", goodsMale);
		
		List<GoodsPicture> pictureMale = goodsDao.selectPicture4Male();
		request.setAttribute("pictureMale", pictureMale);

		List<GoodsInfo> goodsFemale = goodsDao.selectGoodsInfo4Female();
		request.setAttribute("goodsFemale", goodsFemale);
		
		List<GoodsPicture> pictureFemale = goodsDao.selectPicture4Female();
		request.setAttribute("pictureFemale", pictureFemale);

		List<GoodsInfo> goodsChildren = goodsDao.selectGoodsInfo4Children();
		request.setAttribute("goodsChildren", goodsChildren);
		
		List<GoodsPicture> pictureChildren = goodsDao.selectPicture4Children();
		request.setAttribute("pictureChildren", pictureChildren);
		
		return "/index.jsp";
	}
	
}
