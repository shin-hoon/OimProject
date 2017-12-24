package com.oim.application.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ApplicationDAO {
	private static SqlSessionFactory ssf;
	//XML 파싱내용을 전송
	static { //초기화, 자동실행 블록
		try {
			//XML 읽기
			Reader reader=Resources.getResourceAsReader("Config.xml");
			//XML 파싱
			ssf=new SqlSessionFactoryBuilder().build(reader); //reader는 한글까지 읽기때문에 reader를 사용한다.
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
//	public static int meetingTotalPage() { 
//		
//		int totalpage=0;
//		SqlSession session=ssf.openSession(); 
//		try {
//			totalpage=session.selectOne("meetingTotalPage");
//			
//		}catch(Exception ex) {
//			System.out.println("meetingTotalPage: "+ex.getMessage());
//		}finally {
//			if(session!=null) {
//				session.close();
//			}
//		}
//		return totalpage;
//	}
}
