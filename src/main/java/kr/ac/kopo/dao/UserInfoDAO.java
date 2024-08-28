package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.kopo.vo.GoodsInfo;
import kr.ac.kopo.vo.GoodsPicture;
import kr.ac.kopo.vo.UserInfo;
import kr.ac.kopo.vo.Review;
import kr.ac.kopo.vo.Search;

public class UserInfoDAO {
	SqlSession session = null;
	
	public UserInfoDAO() {
		session = new MyBatisConfig().getInstance();
	}
	
	public UserInfo selectMemberById(String id) {
		UserInfo item = session.selectOne("dao.GoodsDAO.selectMemberById", id);
		return item;
	}
	
	public boolean insertMember(UserInfo userInfo) {
		boolean flag = false;

		try {
			session.insert("dao.GoodsDAO.insertMember", userInfo);
			session.commit();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public int checkMember(UserInfo userInfo) {
		int item = session.selectOne("dao.GoodsDAO.checkMember", userInfo);
		return item;
	}
}
