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
	
	//=========ȸ������
    //���̵��ߺ�üũ
  	public int OimIdcheck(String id) {
  		int count=0;
  		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
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
  	
  	
  	//ȸ������
  	public void OimJoin(MemberVO vo) {
  		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
  		
  		
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

	/*//�α��� 
    		public MemberVO OimLogin(String id,String pwd)
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
    		
    		//ȸ��Ż�� 
    		public boolean OimDelete(String id, String pwd)
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
    		}*/

    		
    		
    		
    		
    		
    		
  }
      
      
      
      
      
