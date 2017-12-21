package com.oim.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
   
   //연결객체 
      private Connection conn;
      
      //SQL 전송 객체
      private PreparedStatement ps;
      
      //Oracle URL
      private final String URL="jdbc:oracle:thin:@211.238.142.231:1521:ORCL";
      
      //드라이버 등록
      public MemberDAO() {
         try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");    //new를 쓰지 않아도 클래스를 가져와서 메모리할당을 한다.
            
            
         }catch(Exception ex) {
            System.out.println(ex.getMessage());
         }
      }
      
      //오라클 연결
      public void getConnection()
      {
         try
         {
            // conn scott/1234
            conn = DriverManager.getConnection(URL,"scott","1234");
         }catch(Exception ex) {
            System.out.println(ex.getMessage());
         }
      }
      
      //오라클 해제
      public void disConnection()
      {
         try {
            //통신을 먼저 닫고(SQL 전송 객체)
            if(ps!=null) ps.close();
            
            //기계 연결 해제 (연결객체)
            if(conn!=null)conn.close();
         }catch(Exception ex) {}
      }
      
      
      
      //로그인 
      public MemberVO Login(String id,String pwd)
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
               sql="SELECT om_id,om_pwd,om_name "
                     +"FROM oim_member "
                     +"WHERE om_id=?";
               ps=conn.prepareStatement(sql);
               ps.setString(1, id);
               rs=ps.executeQuery();
               rs.next();
               vo.setOm_id(rs.getString(1));
               vo.setOm_pwd(rs.getString(2));
               vo.setOm_name(rs.getString(3));
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
      
      
      
//=========회원가입
    //아이디중복체크
  	public int memberIdcheck(String id) {
  		int count=0;
  		try {
  			getConnection();
  			String sql="SELECT COUNT(*) "
  					+"FROM oim_member "
  					+"WHERE om_id=?";
  			ps=conn.prepareStatement(sql);
  			ps.setString(1, id);
  			ResultSet rs=ps.executeQuery();
  			rs.next();
  			count=rs.getInt(1);
  			rs.close();
  					
  		}catch(Exception ex) {
  			System.out.println(ex.getMessage());
  		}finally {
  			disConnection();
  		}
  		return count;
  	}
  	
  	
  	//회원가입
  	public void oim_member_Join(MemberVO vo) {
  		try
  		{
  			getConnection();
  			String sql="INSERT INTO oim_member "
  					+ "VALUES(?,?,?,?,?,?,?,SYSDATE)";
  			
  	  		ps=conn.prepareStatement(sql);
  	  		
  	  		ps.setString(1, vo.getOm_id());
  	  		ps.setString(2, vo.getOm_pwd());
  	  		ps.setString(3, vo.getOm_name());
  	  		ps.setString(5, vo.getOm_birth());
  	  		ps.setString(4, vo.getOm_gender());
  	  		ps.setString(6, vo.getOm_tel());
  	  		ps.setString(7, vo.getOm_company());
  	  		ps.executeUpdate();
  		}
  		catch(Exception ex) {
  			System.out.println(ex.getMessage());
  		}finally {
  			disConnection();
  		}
  	}
  	

  	
  }
      
      
      
      
      
