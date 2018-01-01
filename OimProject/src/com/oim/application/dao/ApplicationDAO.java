package com.oim.application.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.oim.meeting.dao.MeetingVO;

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
	
	//���� ������ Ȩ
	public static List<MeetingVO> MyMeetingList(Map map) { 
		
		List<MeetingVO> list = new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); 
		try {
			list=session.selectList("MyMeetingList",map);
			
		}catch(Exception ex) {
			System.out.println("MyMeetingList : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	//���� ������ Ȩ2
		public static List<MeetingVO> MyMeetingList2(String om_hid) { 
			
			List<MeetingVO> list = new ArrayList<MeetingVO>();
			SqlSession session=ssf.openSession(); 
			try {
				list=session.selectList("MyMeetingList2",om_hid);
				
			}catch(Exception ex) {
				System.out.println("MyMeetingList2 : "+ex.getMessage());
			}finally {
				if(session!=null) {
					session.close();
				}
			}
			return list;
		}
	//���� ��������
		public static int MyMeetingTotalPage(String om_hid) { 
			
			int totalpage = 0;
			SqlSession session=ssf.openSession(); 
			try {
				totalpage=session.selectOne("MyMeetingTotalPage",om_hid);
				
			}catch(Exception ex) {
				System.out.println("MyMeetingTotalPage : "+ex.getMessage());
			}finally {
				if(session!=null) {
					session.close();
				}
			}
			return totalpage;
		}
		
	//���� ��û�ڰ���
	public static MeetingVO MyMeetingOne(int meet_no) {
		MeetingVO vo = new MeetingVO();
		SqlSession session=ssf.openSession(); 
		try {
			vo=session.selectOne("MyMeetingOne",meet_no);
			
		}catch(Exception ex) {
			System.out.println("MyMeetingOne : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}

	public static List<ApplicationVO> ApplicationListCheckData(ApplicationVO vo) { 
		
		List<ApplicationVO> list = new ArrayList<ApplicationVO>();
		SqlSession session=ssf.openSession(); 
		try {
			list=session.selectList("ApplicationListCheckData",vo);
			
		}catch(Exception ex) {
			System.out.println("ApplicationListCheckData : "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	//���ӽ�û
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
