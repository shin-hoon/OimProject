package com.oim.meeting.dao;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MeetingDAO {
	private static SqlSessionFactory ssf;
	//XML 파싱내용을 전송
//	static { //초기화, 자동실행 블록
//		try {
//			//XML 읽기
//			Reader reader=Resources.getResourceAsReader("Config.xml");
//			//XML 파싱
//			ssf=new SqlSessionFactoryBuilder().build(reader); //reader는 한글까지 읽기때문에 reader를 사용한다.
//		}catch(Exception ex) {
//			System.out.println(ex.getMessage());
//		}
//	}
	
	public static int meetingTotalPage() { //모임 총 페이지수 구하기
		
		int totalpage=0;
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			totalpage=session.selectOne("meetingTotalPage");
			
		}catch(Exception ex) {
			System.out.println("meetingTotalPage: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return totalpage;
	}
	
	public static List<MeetingVO> meetingListData(Map map){ //모임리스트 뿌리기
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingListData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingListData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //커넥션을 반환한다.
			
		}
		return list;
	}
	//dao
	public static MeetingVO meetingDetailData(int meet_no){ //모임 상세정보 보여주기
	      
	      MeetingVO vo=new MeetingVO();
	      SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
	      try {
	         vo=session.selectOne("meetingDetailData",meet_no);
	         
	      }catch(Exception ex) {
	         System.out.println("meetingDetailData : "+ex.getMessage());
	      }finally {
	         if(session!=null)
	            session.close(); //커넥션을 반환한다.
	         
	      }
	      return vo;
	   }
	
	   
//	   public MeetingDAO() { //데이터  파싱에서 DB에 insert하는 용도로 작성한 임시코드
//	      try {
//	         Class.forName("oracle.jdbc.driver.OracleDriver");
//	      }catch (Exception e) {
//	         System.out.println(e.getMessage());
//	         e.printStackTrace();
//	      }
//	   }	   
//		 private Connection conn;
//		 private PreparedStatement ps;
//		 private final String URL = "jdbc:oracle:thin:@211.238.142.223:1521:ORCL";
//	     public void getConnection() {
//	      try {
//	          System.out.println("연결 성공");
//	         conn=DriverManager.getConnection(URL,"scott","1234");
//
//	      }catch (Exception e) {
//	         System.out.println(e.getMessage());
//	      }
//	   }
//	   
//	   public void disConnection() {
//	      try {
//	         if(ps!=null) ps.close();
//	         if(conn!=null) conn.close();
//	      }catch (Exception e) {}
//	   }   
//		public void insertDetail(MeetingVO vo) { 
//			
//			try {
//				getConnection();
//		         String sql = "UPDATE meeting SET meet_detail=? WHERE meet_no=?";
//		         
//		         ps = conn.prepareStatement(sql);
//		         ps.setString(1, vo.getMeet_detail());
//		         ps.setInt(2, vo.getMeet_no());
//		         System.out.println(vo.getMeet_detail());
//		         System.out.println(vo.getMeet_no());
//		         ps.executeUpdate();
//		         ps.close();
//		         
//			}catch(Exception ex) {
//				ex.printStackTrace();
//			}finally {
//				disConnection();
//			}
//
//		}
		
}

