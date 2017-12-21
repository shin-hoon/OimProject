package com.oim.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
   
   //���ᰴü 
      private Connection conn;
      
      //SQL ���� ��ü
      private PreparedStatement ps;
      
      //Oracle URL
      private final String URL="jdbc:oracle:thin:@211.238.142.231:1521:ORCL";
      
      //����̹� ���
      public MemberDAO() {
         try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");    //new�� ���� �ʾƵ� Ŭ������ �����ͼ� �޸��Ҵ��� �Ѵ�.
            
            
         }catch(Exception ex) {
            System.out.println(ex.getMessage());
         }
      }
      
      //����Ŭ ����
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
      
      //����Ŭ ����
      public void disConnection()
      {
         try {
            //����� ���� �ݰ�(SQL ���� ��ü)
            if(ps!=null) ps.close();
            
            //��� ���� ���� (���ᰴü)
            if(conn!=null)conn.close();
         }catch(Exception ex) {}
      }
      
      
      
      		//�α��� 
    		public MemberVO Login(String id,String pwd)
    		{
    			MemberVO vo=new MemberVO();
    			try {
    				getConnection();
    				
    				//1. ���̵� �ִ��� Ȯ��
    				String sql="SELECT COUNT(*) FROM oim_member WHERE om_id=?";
    				ps=conn.prepareStatement(sql);
    				ps.setString(1, id);
    				ResultSet rs=ps.executeQuery();
    				rs.next();
    				int no=rs.getInt(1);
    				
    				if(no==0)  
    				{
    					vo.setCount(1);  //���̵� �������� �ʴ´ٸ� count=1
    				}
    				else //���̵� �����Ѵٸ�
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
    					
    					if(pwd.equals(vo.getOm_pwd())) //��й�ȣ���� ��ġ�Ѵٸ�
    					{
    						vo.setCount(3);  //count=3
    					}
    					else  //��й�ȣ�� �ٸ��ٸ�
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
    		
    		
    		//ȸ������ ����
    		public void Update(MemberVO vo)
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
    		
    		//ȸ��Ż�� 
    		public boolean Delete(String id, String pwd)
    		{
    			boolean bcheck=false;
    			
    			try {
    				getConnection();
    				
    				//��й�ȣ Ȯ��
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
    					
    					//ȸ������
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
    		}
      
      
      
//=========ȸ������
    //���̵��ߺ�üũ
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
  	
  	
  	//ȸ������
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
      
      
      
      
      
