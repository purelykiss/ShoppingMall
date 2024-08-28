package kr.ac.kopo.dao;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConfig {
	
	private SqlSession session;
	
	public MyBatisConfig(){
		String resource = "mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();
		} catch (Exception e) {
			System.out.println("mybatis-config.xml 로드 안됨");
			e.printStackTrace();
		}
	}
	
	public SqlSession getInstance() {
		return session;
	}
	
}
