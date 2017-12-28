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

	/*
    		//회원탈퇴 
    		public boolean OimDelete(String id, String pwd)
    		{
    			boolean bcheck=false;
    			
    			try {
    				getConnection();
    				
    				//비밀번호 확인
    				String sql="SELECT om_pwd FROM oim_member "
    							+"WHERE om_id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, id);
    				ResultSet rs=ps.executeQuery();
    				rs.next();
    				String db_pwd=rs.getString(1);
    				
    				if(db_pwd.equals(pwd))
    				{
    					bcheck=true;
    					
    					//회원삭제
    					sql="DELETE FROM oim_member "
    							+"WHERE om_id=?";
    					ps=conn.prepareStatement(sql);
    					ps.setString(1, id);
    					ps.executeUpdate();
    					
    				}
    				
    			}catch(Exception ex)
    			{
    				System.out.println(ex.getMessage());
    			}
    			finally
    			{
    				disConnection();
    			}
    			return bcheck;
    		}*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    		
    		
    		
    		
    		
  }
      
      
      
      
      
