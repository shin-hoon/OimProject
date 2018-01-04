package com.oim.member.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import com.oim.meeting.dao.MeetingVO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
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
	
	//=========회원가입
	 //아이디중복체크
  	public static int OimIdcheck(String id) {
  		int count=0;
  		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
  		try {
  			count=session.selectOne("OimIdcheck",id);
  					
  		}catch(Exception ex) {
  			System.out.println("OimIdcheck: "+ex.getMessage());
  		}finally {
  			if(session!=null)
  				session.close();
  		}
  		return count;
  	}
  	
  	
  	
  	//회원가입
  	public static void OimJoin(MemberVO vo) {
  		
  		System.out.println("");
  		SqlSession session=ssf.openSession(true); //주소값을 얻어올때 사용한다.
  		try
  		{
  			session.insert("OimJoin",vo);
  			
  		}
  		catch(Exception ex) 
  		{
  			System.out.println("OimJoin: "+ex.getMessage());
  		}
  		finally {
  			if(session!=null)
  				session.close();
  			
  		}
  	}
  	
  	
  	
  	
  	
  	
  	
  	
  	//로그인) 아이디 존재 체크
  	public static int OimLogincheck(String id)
  	{
  		int count=0;
  		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
  		try {
  			count=session.selectOne("OimLogincheck",id);
  			
  					
  		}catch(Exception ex) {
  			System.out.println("OimLogincheck: "+ex.getMessage());
  		}finally {
  			if(session!=null)
  				session.close();
  		}
  		return count;
  		
  	}
  	
  	//로그인
  	public static MemberVO OimLogin(String id)
	{
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
				vo=session.selectOne("OimLogin",id);
			}
			
		catch(Exception ex)
		{
			System.out.println("OimLogin: "+ex.getMessage());
		}
		finally
		{
			if(session!=null)
  				session.close();
		}
		return vo;
	}
  	
  	//회원정보 수정
  	public static void OimUpdate(MemberVO vo)
	{
  		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
		try {
			
			session.update("OimUpdate",vo);
			session.commit();
			System.out.println("회원정보수정:"+vo.getOm_tel()+vo.getOm_id()+vo.getOm_pwd());
			
			
		}catch(Exception ex)
		{
			System.out.println("OimUpdate"+ex.getMessage());
		}
		finally
		{
			if(session!=null)
  				session.close();
		}
	}
  	
  	//회원탈퇴) 비밀번호 확인
  	public static String OimDeletecheck(String id)
  	{
  		String db_pwd="";
  		SqlSession session=ssf.openSession();
  		
  		
  		try {
  			
  			db_pwd=session.selectOne("OimDeletecheck",id);  
  			
  			
  		}catch(Exception ex)
  		{
  			System.out.println("OimDeletecheck: "+ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return db_pwd;
  	}
  	
  	
  	//회원탈퇴 
  	public static void OimDelete(String id)
  	{
  		SqlSession session=ssf.openSession(true);
  		try {
  			session.delete("OimDelete",id);
  		}catch(Exception ex)
  		{
  			System.out.println("OimDelete: "+ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  	}

	//마이페이지 홈
  	public static MemberVO Oimmypagehome(String om_id)
  	{
  		MemberVO vo=new MemberVO();
  		SqlSession session=ssf.openSession();
  		try
  		{
  			vo=session.selectOne("Oimmypagehome",om_id);
  			
  		}catch(Exception ex)
  		{
  			System.out.println("Oimmypagehome: "+ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		return vo;
  	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
  	public static List<MeetingVO> MainSlider()
  	{
  		List<MeetingVO> list8=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list8=session.selectList("MainSlider");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list8;
  	}
  	
  	
  	public static List<MeetingVO> TodayMeeting()
  	{
  		List<MeetingVO> list=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list=session.selectList("TodayMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list;
  	}
    	
  	
  	public static List<MeetingVO> EventMeeting()
  	{
  		List<MeetingVO> list2=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list2=session.selectList("EventMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list2;
  	}
  	
  	
  	
  	public static List<MeetingVO> StudyTagMeeting()
  	{
  		List<MeetingVO> list3=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list3=session.selectList("StudyTagMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list3;
  	}
  	
  	public static List<MeetingVO> HobbyTagMeeting()
  	{
  		List<MeetingVO> list4=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list4=session.selectList("HobbyTagMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list4;
  	}
  	
  	public static List<MeetingVO> MuTagMeeting()
  	{
  		List<MeetingVO> list5=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list5=session.selectList("MuTagMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list5;
  	}
  	
  	public static List<MeetingVO> ProTagMeeting()
  	{
  		List<MeetingVO> list6=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list6=session.selectList("ProTagMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list6;
  	}
  	
  	public static List<MeetingVO> HotMeeting()
  	{
  		List<MeetingVO> list7=new ArrayList<MeetingVO>();
  		SqlSession session=ssf.openSession();
  		
  		try {
  			
  			list7=session.selectList("HotMeeting");
  			
  		}catch(Exception ex)
  		{
  			System.out.println(ex.getMessage());
  		}
  		finally
  		{
  			if(session!=null)
  				session.close();
  		}
  		
  		return list7;
  	}
    		
  }
      
      
      
      
      
