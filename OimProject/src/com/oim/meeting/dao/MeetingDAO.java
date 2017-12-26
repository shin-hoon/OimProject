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

import com.oim.member.dao.MemberVO;

public class MeetingDAO {
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
	
	public static int meetingTotalPage() { //���� �� �������� ���ϱ�
		
		int totalpage=0;
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
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
	
	public static List<MeetingVO> meetingListData(Map map){ //���Ӹ���Ʈ �Ѹ���
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
		try {
			list=session.selectList("meetingListData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingListData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //Ŀ�ؼ��� ��ȯ�Ѵ�.
		}
		return list;
	}
	
	public static List<MeetingVO> meetingFindData(Map map){ //���Ӱ˻���� ���͸��ؼ� �Ѹ���
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
		try {
			list=session.selectList("meetingFindData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingFindData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //Ŀ�ؼ��� ��ȯ�Ѵ�.
			
		}
		return list;
	}
	
	public static int meetingFindTotalPage() { //�˻���� �� �������� ���ϱ�
		
		int totalpage=0;
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
		try {
			totalpage=session.selectOne("meetingFindTotalPage");
			
		}catch(Exception ex) {
			System.out.println("meetingFindTotalPage: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return totalpage;
	}
	
	//dao
	public static MeetingVO meetingDetailData(int meet_no){ //���� ������ �����ֱ�
	      
	      MeetingVO vo=new MeetingVO();
	      SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
	      try {
	    	 session.update("meetingHitIncrement",meet_no);
	    	 session.commit();
	         vo=session.selectOne("meetingDetailData",meet_no);
	         
	      }catch(Exception ex) {
	         System.out.println("meetingDetailData : "+ex.getMessage());
	      }finally {
	         if(session!=null)
	            session.close(); //Ŀ�ؼ��� ��ȯ�Ѵ�.
	         
	      }
	      return vo;
	   }
	
	public static MemberVO meetingInsertData(int om_id) { //���Ӱ���ȭ�鿡�� ����� ���� �����ֱ�
		
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession();
		try {
			vo=session.selectOne("meetingInsertData",om_id);
			
		}catch(Exception ex) {
			System.out.println("meetingInsertData: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}
	
	public static void meetingInsertOk(MeetingVO vo) { //���Ӱ��� insert
		
		SqlSession session=ssf.openSession(true); //����Ŀ�� ����
		try {
			session.insert("meetingInsertOk",vo);
			
		}catch(Exception ex) {
			System.out.println("meetingInsertOk: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	public static MemberVO meetingDetailInfo(String om_id) { //���Ӱ���ȭ�鿡�� ����� ���� �����ֱ�
		
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession();
		try {
			vo=session.selectOne("meetingDetailInfo",om_id);
			
		}catch(Exception ex) {
			System.out.println("meetingDetailInfo: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return vo;
	}

	   
//	   public MeetingDAO() { //������  �Ľ̿��� DB�� insert�ϴ� �뵵�� �ۼ��� �ӽ��ڵ�
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
//	          System.out.println("���� ����");
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

