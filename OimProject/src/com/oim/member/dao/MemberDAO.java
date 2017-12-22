package com.oim.member.dao;

import java.io.Reader;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
  	public int OimIdcheck(String id) {
  		int count=0;
  		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
  		try {
  			count=session.selectOne("memberIdcheck");
  					
  		}catch(Exception ex) {
  			System.out.println("memberIdcheck: "+ex.getMessage());
  		}finally {
  			if(session!=null)
  				session.close();
  		}
  		return count;
  	}
  	
  	
  	//회원가입
  	public void OimJoin(MemberVO vo) {
  		SqlSession session=ssf.openSession(); //주소값을 얻어올때 사용한다.
  		
  		
  		try
  		{
  			session.insert("oim_member_Join",vo);
  		}
  		catch(Exception ex) {
  			System.out.println(ex.getMessage());
  		}finally {
  			if(session!=null)
  				session.close();
  			
  		}
  	}

	/*//로그인 
    		public MemberVO OimLogin(String id,String pwd)
    		{
    			MemberVO vo=new MemberVO();
    			try {
    				getConnection();
    				
    				//1. 아이디 있는지 확인
    				String sql="SELECT COUNT(*) FROM oim_member WHERE om_id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, id);
    				ResultSet rs=ps.executeQuery();
    				rs.next();
    				int no=rs.getInt(1);
    				
    				if(no==0)  
    				{
    					vo.setCount(1);  //아이디가 존재하지 않는다면 count=1
    				}
    				else //아이디가 존재한다면
    				{
    					sql="SELECT om_id,om_pwd,om_name,om_birth,om_gender,om_tel,om_company,om_regdate "
    							+"FROM oim_member "
    							+"WHERE om_id=?";
    					ps=conn.prepareStatement(sql);
    					ps.setString(1, id);
    					rs=ps.executeQuery();
    					rs.next();
    					vo.setOm_id(rs.getString(1));
    					vo.setOm_pwd(rs.getString(2));
    					vo.setOm_name(rs.getString(3));
    					vo.setOm_birth(rs.getString(4));
    					vo.setOm_gender(rs.getString(5));
    					vo.setOm_tel(rs.getString(6));
    					vo.setOm_company(rs.getString(7));
    					vo.setOm_regdate(rs.getDate(8));
    					rs.close();
    					ps.close();
    					
    					if(pwd.equals(vo.getOm_pwd())) //비밀번호까지 일치한다면
    					{
    						vo.setCount(3);  //count=3
    					}
    					else  //비밀번호가 다르다면
    					{
    						vo.setCount(2);  //count=2
    					}
    					
    				}
    				
    			}catch(Exception ex)
    			{
    				System.out.println(ex.getMessage());
    			}
    			finally
    			{
    				disConnection();
    			}
    			return vo;
    		}
    		
    		
    		//회원정보 수정
    		public void OimUpdate(MemberVO vo)
    		{
    			
    			try {
    				getConnection();
    				
    				String sql="UPDATE oim_member SET "
    							+"om_tel=?,om_pwd=? "
    							+"WHERE om_id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, vo.getOm_tel());
    				ps.setString(2, vo.getOm_pwd());
    				ps.setString(3, vo.getOm_id());
    				ps.executeUpdate();
    				
    				
    			}catch(Exception ex)
    			{
    				System.out.println(ex.getMessage());
    			}
    			finally
    			{
    				disConnection();
    			}
    		}
    		
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

    		
    		
    		
    		
    		
    		
  }
      
      
      
      
      
