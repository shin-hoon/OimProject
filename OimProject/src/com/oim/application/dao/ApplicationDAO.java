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
	
	//모임 관리자 홈
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
	//모임 관리자 홈2
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
	//모임 총페이지
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
		
	//모임 신청자관리
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
	
	//모임신청
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
