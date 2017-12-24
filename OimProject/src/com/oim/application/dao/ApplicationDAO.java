package com.oim.application.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ApplicationDAO {
	private static SqlSessionFactory ssf;
	//XML �Ľ̳����� ����
	static { //�ʱ�ȭ, �ڵ����� ���
		try {
			//XML �б�
			Reader reader=Resources.getResourceAsReader("Config.xml");
			//XML �Ľ�
			ssf=new SqlSessionFactoryBuilder().build(reader); //reader�� �ѱ۱��� �б⶧���� reader�� ����Ѵ�.
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
