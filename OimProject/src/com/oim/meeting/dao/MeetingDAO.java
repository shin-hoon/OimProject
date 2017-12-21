package com.oim.meeting.dao;
import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	public static List<MeetingVO> meetingListData(Map map){
		
		List<MeetingVO> list=new ArrayList<MeetingVO>();
		SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
		try {
			list=session.selectList("meetingListData",map);
			
		}catch(Exception ex) {
			System.out.println("meetingListData"+ex.getMessage());
		}finally {
			if(session!=null)
				session.close(); //Ŀ�ؼ��� ��ȯ�Ѵ�.
			
		}
		return list;
	}
	public static MeetingVO meetingDetailData(int meet_no){
	      
	      MeetingVO vo=new MeetingVO();
	      SqlSession session=ssf.openSession(); //�ּҰ��� ���ö� ����Ѵ�.
	      try {
	         vo=session.selectOne("meetingDetailData",meet_no);
	         
	      }catch(Exception ex) {
	         System.out.println("meetingDetailData : "+ex.getMessage());
	      }finally {
	         if(session!=null)
	            session.close(); //Ŀ�ؼ��� ��ȯ�Ѵ�.
	         
	      }
	      return vo;
	   } 
}

