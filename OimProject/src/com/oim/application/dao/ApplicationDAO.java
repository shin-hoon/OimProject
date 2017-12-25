package com.oim.application.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

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
	
	public static List<ApplicationVO> ApplicationListCheckData(String om_hid) { 
		
		List<ApplicationVO> list = new ArrayList<ApplicationVO>();
		SqlSession session=ssf.openSession(); 
		try {
			list=session.selectList("ApplicationListCheckData",om_hid);
			
		}catch(Exception ex) {
			System.out.println("ApplicationListCheckData : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	public static void ApplicationInsertData(ApplicationVO vo) { 
		
		
		SqlSession session=ssf.openSession(); 
		try {
			session.insert("ApplicationInsertData",vo);
			session.commit();
			session.update("ApplicationlimitUpdate",vo.getMeet_no());
			session.commit();
		}catch(Exception ex) {
			System.out.println("ApplicationInsertData : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	public static List<ApplicationVO> ApplicationMyListData(String om_aid){
		List<ApplicationVO> list = new ArrayList<ApplicationVO>();
		SqlSession session=ssf.openSession(); 
		try {
			list=session.selectList("ApplicationMyListData",om_aid);
			
		}catch(Exception ex) {
			System.out.println("ApplicationMyListData : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
}
