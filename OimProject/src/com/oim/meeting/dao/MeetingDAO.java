package com.oim.meeting.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.oim.member.dao.MemberVO;

public class MeetingDAO {
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
	
	public static List<Map<String,Object>> meetingTotalPage() { //모임 총 페이지수 구하기
		
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingTotalPage");
			
		}catch(Exception ex) {
			System.out.println("meetingTotalPage: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	public static List<MeetingVO> meetingListData(Map<String,Object> map){ //모임리스트 뿌리기
		
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
	
	public static List<MeetingVO> meetingFindData(Map<String,Object> map){ //체크박스 검색결과 필터링해서 뿌리기
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingFindData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingFindData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //커넥션을 반환한다.
			
		}
		return list;
	}
	
	public static List<Map<String,Object>> meetingFindTotalPage(Map<String,Object> map) { //체크박스 검색결과 총 페이지수 구하기
		
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingFindTotalPage",map);
			
		}catch(Exception ex) {
			System.out.println("meetingFindTotalPage: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return list;
	}
	
	public static List<MeetingVO> meetingSearchData(Map<String,Object> map){ //검색어 검색결과 필터링해서 뿌리기
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingSearchData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingSearchData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //커넥션을 반환한다.
		}
		return list;
	}
	
	public static List<Map<String,Object>> meetingSearchTotalPage(String searchText){ //검색어 검색결과 총 페이지수 구하기
		
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			list=session.selectList("meetingSearchTotalPage", searchText);
			
		}catch(Exception ex) {
			System.out.println("meetingSearchTotalPage: "+ex.getMessage());
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
	    	 session.update("meetingHitIncrement",meet_no);
	    	 session.commit();
	         vo=session.selectOne("meetingDetailData",meet_no);
	         
	      }catch(Exception ex) {
	         System.out.println("meetingDetailData : "+ex.getMessage());
	      }finally {
	         if(session!=null)
	            session.close(); //커넥션을 반환한다.
	         
	      }
	      return vo;
	   }
	
	
	public static void meetingInsert(MeetingVO vo) { //모임개설 insert
		
		SqlSession session=ssf.openSession(true); //오토커밋 적용
		try {
			session.insert("meetingInsert",vo);
			
		}catch(Exception ex) {
			System.out.println("meetingInsert: "+ex.getMessage());
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	public static int getMeetingNumber() { //이미지 저장할때 이름으로 쓰기위해 얻는 모임번호
		
		int meet_no=0;
		SqlSession session=ssf.openSession();
		try {
			meet_no=session.selectOne("getMeetingNumber");
		}catch(Exception ex) {
			System.out.println("getMeetingNumber: "+ex.getMessage());
		}finally {
			if(session!=null) {
				session.close();
			}
		}
		return meet_no;
	}
	
	public static MemberVO meetingDetailInfo(String om_id) { //모임개설화면에서 사용자 정보 보여주기
		
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
	
	public static MeetingVO meetingUpdateData(int meet_no) { //모임수정창 정보
		
		MeetingVO vo=new MeetingVO();
		SqlSession session=ssf.openSession();
		
		try {
			vo=session.selectOne("meetingUpdateData",meet_no);
		}catch(Exception ex) {
			System.out.println("meetingUpdateData: "+ex.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		
		return vo;
	}
	
	public static void meetingUpdate(MeetingVO vo) { //모임수정창 데이터
		
		SqlSession session=ssf.openSession(true);
		try {
			session.update("meetingUpdate",vo);
		}catch(Exception ex) {
			System.out.println("meetingUpdate: "+ex.getMessage());
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	public static void meetingDelete(MeetingVO vo) { //모임삭제
		
		SqlSession session=ssf.openSession();
		try {
			//모든신청내역삭제
			session.delete("MeetingApplicationDelete",vo.getMeet_no());
			//모든찜내역삭제
			session.delete("MeetinglikeDelete",vo.getMeet_no());
			//모든댓글삭제
			session.delete("MeetingreplyDelete",vo.getMeet_no());
			//모든모임삭제
			session.delete("meetingDelete",vo);
			session.commit();
		}catch(Exception ex) {
			session.rollback();
			System.out.println("meetingDelete: "+ex.getMessage());
			ex.printStackTrace();
		}finally {
			if(session!=null) {
				session.close();
			}
		}
	}
	
	public static int likeCount(LikeVO vo) { //찜저장
		   int count=0;
		   SqlSession session=ssf.openSession();
		   try {
			   count=session.selectOne("likeCount",vo);
		   }catch(Exception ex) {
			   System.out.println(ex.getMessage());
		   }finally {
			   if(session!=null)
				   session.close();
		   }
		   
		   return count;
	   }
	   
	   public static void likeInsert(LikeVO vo) { //찜하기
		   SqlSession session=ssf.openSession();
		   try {
			   session.insert("likeInsert",vo);
			   session.update("likeIncrement",vo.getMeet_no());
			   session.commit();
		   }catch(Exception ex) {
			   session.rollback();
			   System.out.println(ex.getMessage());
		   }finally {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   //ORM(Object Relation Mapper) => ex)Mybatis
	   //DAO DTO(Data Transfer Object) -> VO와 같다(Value Object) Service
	   public static List<LikeVO> likeListData(String id){ //찜목록
		   List<LikeVO> list=
				   new ArrayList<LikeVO>();
		   SqlSession session=ssf.openSession();
		   try{
			   
			list=session.selectList("likeListData",id);
			
		   }catch(Exception ex){
			   
			   System.out.println(ex.getMessage());
			   
		   }finally{
			   if(session!=null) {
				   session.close();
			   }
		   }
		   return list;
	   }
	   public static void likeDelete(LikeVO vo) { //찜삭제
		   
		   SqlSession session=ssf.openSession();
		   try{
			   
			   
			session.delete("likeDelete",vo);
			session.update("likeDecrement",vo.getMeet_no());
			session.commit();
		   }catch(Exception ex){
			   session.rollback();
			   System.out.println(ex.getMessage());
			   
		   }finally{
			   if(session!=null) {
				   session.close();
			   }
		   }
	   }
	   public static void DbInsert(MeetingVO vo) { //DBinsert
		   
		   SqlSession session=ssf.openSession(true);
		   try{
			session.insert("dbInsert",vo);
			session.commit();
		   }catch(Exception ex){
			   System.out.println(ex.getMessage());
			   
		   }finally{
			   if(session!=null) {
				   session.close();
			   }
		   }
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

