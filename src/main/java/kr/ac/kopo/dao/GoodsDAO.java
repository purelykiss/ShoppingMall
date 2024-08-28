package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.BasketItem;
import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.Review;
import kr.ac.kopo.vo.Search;

public class GoodsDAO {
	SqlSession session = null;
	
	public GoodsDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public List<GoodsInfo> selectGoodsInfo4Male() {
		List<GoodsInfo> item = session.selectList("dao.GoodsDAO.selectGoodsInfo4Male");
		return item;
	}
	
	public List<GoodsPicture> selectPicture4Male(){
		List<GoodsPicture> item = session.selectList("dao.GoodsDAO.selectGoodsPicture4Male");
		return item;
	}
	
	public List<GoodsInfo> selectGoodsInfo4Female() {
		List<GoodsInfo> item = session.selectList("dao.GoodsDAO.selectGoodsInfo4Female");
		return item;
	}
	
	public List<GoodsPicture> selectPicture4Female(){
		List<GoodsPicture> item = session.selectList("dao.GoodsDAO.selectGoodsPicture4Female");
		return item;
	}
	
	public List<GoodsInfo> selectGoodsInfo4Children() {
		List<GoodsInfo> item = session.selectList("dao.GoodsDAO.selectGoodsInfo4Children");
		return item;
	}
	
	public List<GoodsPicture> selectPicture4Children(){
		List<GoodsPicture> item = session.selectList("dao.GoodsDAO.selectGoodsPicture4Children");
		return item;
	}
	
	public GoodsInfo selectGoodsInfoById(String id){
		GoodsInfo item = session.selectOne("dao.GoodsDAO.selectGoodsInfoById", id);
		return item;
	}
	
	public List<GoodsPicture> selectGoodsPictureById(String id) {
		List<GoodsPicture> item =  session.selectList("dao.GoodsDAO.selectGoodsPictureById", id);
		return item;
	}
	
	public List<Review> selectReviewBySellcode(String id){
		List<Review> item = session.selectList("dao.GoodsDAO.selectReviewBySellcode", id);
		return item;
	}
	
	public Search selectSearchCountBySearch(Search search) {
		Search item = session.selectOne("dao.GoodsDAO.selectgoodsInfoCountBySearch", search);
		return item;
	}
	
	public List<GoodsInfo> selectGoodsInfoBySearch(Search search){
		List<GoodsInfo> item = session.selectList("dao.GoodsDAO.selectgoodsInfoBySearch", search);
		return item;
	}
	
	public List<GoodsPicture> selectgoodsPictureBySearch(Search search){
		List<GoodsPicture> item = session.selectList("dao.GoodsDAO.selectgoodsPictureBySearch", search);
		return item;
	}
	
	public boolean insertBasketItem(BasketItem basketItem) {
		boolean flag = false;
		try {
			session.insert("dao.GoodsDAO.insertBasketItem",basketItem);
			session.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public List<BasketItem> selectBasketItemById(String id){
		List<BasketItem> item =  session.selectList("dao.GoodsDAO.selectBasketItemById", id);
		return item;
	}
	
	public Search selectBasketItemCountBySearch(Search search) {
		Search item = session.selectOne("dao.GoodsDAO.selectBasketItemCountBySearch", search);
		return item;
	}
	
	public List<BasketItem> selectBasketItemBySearch(Search search){
		List<BasketItem> item =  session.selectList("dao.GoodsDAO.selectBasketItemBySearch", search);
		return item;
	}
	
	public List<GoodsInfo> selectgoodsInfoByBasketById(Search search){
		List<GoodsInfo> item =  session.selectList("dao.GoodsDAO.selectgoodsInfoByBasketById", search);
		return item;
	}
	
	public List<GoodsPicture> selectgoodsPictureByBasketById(Search search){
		List<GoodsPicture> item =  session.selectList("dao.GoodsDAO.selectgoodsPictureByBasketById", search);
		return item;
	}
	
	public int selectgoodsPriceByBasketById(String id) {
		int item = session.selectOne("dao.GoodsDAO.selectgoodsPriceByBasketById",id);
		return item;
	}
	
	public boolean deleteBasketItemById(String id) {
		boolean flag = false;
		try {
			session.delete("dao.GoodsDAO.deleteBasketItemById",id);
			session.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	
	public boolean deleteBasketItemByCode(BasketItem basketItem) {
		boolean flag = false;
		try {
			session.delete("dao.GoodsDAO.deleteBasketItemByCode",basketItem);
			session.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}