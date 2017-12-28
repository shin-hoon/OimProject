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
  	public static int OimIdcheck(String id) {
  		int count=0;
  		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
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
  	
  	
  	
  	//ȸ������
  	public static void OimJoin(MemberVO vo) {
  		
  		System.out.println("");
  		SqlSession session=ssf.openSession(true); //�ּҰ��� ���ö� ����Ѵ�.
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
  	
  	
  	
  	
  	
  	
  	
  	
  	//�α���) ���̵� ���� üũ
  	public static int OimLogincheck(String id)
  	{
  		int count=0;
  		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
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
  	
  	//�α���
  	public static MemberVO OimLogin(String id)
	{
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
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
  	
  	//ȸ������ ����
  	public static void OimUpdate(MemberVO vo)
	{
  		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
		try {
			
			session.update("OimUpdate",vo);
			session.commit();
			System.out.println("ȸ����������:"+vo.getOm_tel()+vo.getOm_id()+vo.getOm_pwd());
			
			
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
  	
  	//ȸ��Ż��) ��й�ȣ Ȯ��
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
  	
  	
  	//ȸ��Ż�� 
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
      
      
      
      
      
