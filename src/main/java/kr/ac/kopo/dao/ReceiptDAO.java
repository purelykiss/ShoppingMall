package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.UserInfo;
import kr.ac.kopo.vo.Receipt;
import kr.ac.kopo.vo.Review;
import kr.ac.kopo.vo.Search;

public class ReceiptDAO {
	SqlSession session = null;
	
	public ReceiptDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	/*
	public boolean subtractStockById(String id) {
		boolean flag = false;
		try {
			session.update("dao.GoodsDAO.subtractStockById", id);
			flag = true;
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean insertReceiptById(String id) {
		boolean flag = false;
		try {
			session.insert("dao.GoodsDAO.insertReceiptById", id);
			flag = true;
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteBasketItemById(String id) {
		boolean flag = false;
		try {
			session.delete("dao.GoodsDAO.deleteBasketItemById", id);
			flag = true;
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	public void commit() {
		boolean flag = false;
		try {
			session.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void rollback() {
		session.rollback();
	}
	*/
	
	public boolean proceedPurchase(String id) {
		boolean flag = false;
		try {
			session.update("dao.GoodsDAO.subtractStockById",id);
			session.insert("dao.GoodsDAO.insertReceiptById",id);
			session.delete("dao.GoodsDAO.deleteBasketItemById",id);
			session.commit();
			flag = true;
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		return flag;
	}
	
	public Search selectReceiptCountBySearch(Search search) {
		Search item = session.selectOne("dao.GoodsDAO.selectReceiptCountBySearch", search);
		return item;
	}
	
	public List<Receipt> selectReceiptBySearch(Search search){
		List<Receipt> item = session.selectList("dao.GoodsDAO.selectReceiptBySearch", search);
		return item;
	}
	
	public List<GoodsInfo> selectgoodsInfoByReceiptBySearch(Search search){
		List<GoodsInfo> item = session.selectList("dao.GoodsDAO.selectgoodsInfoByReceiptBySearch", search);
		return item;
	}
	
	public List<GoodsPicture> selectgoodsPictureByReceiptBySearch(Search search){
		List<GoodsPicture> item = session.selectList("dao.GoodsDAO.selectgoodsPictureByReceiptBySearch", search);
		return item;
	}
}
