package com.oim.ntboard.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.oim.qaboard.dao.qaboardVO;





public class ntboardDAO {
private static SqlSessionFactory ssf;
	
	static
	   {
		   try
		   {
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
			   // 파싱 완료
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
			   ex.printStackTrace();
		   }
	   }
	   public static List<ntboardVO> NtboardListData(Map map)
	   {
		   SqlSession session=ssf.openSession();
		   List<ntboardVO> list=null;
		   try
		   {
		      list=session.selectList("NtboardListData",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
		      session.close();
		   }
		   return list;
	   }
	   public static int NtboardTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   // session : connection
			   session=ssf.openSession(); //autocommit(false)
			   total=session.selectOne("NtboardTotalPage");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   //반환
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	   public static void NtboardInsert(ntboardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
		      session.insert("NtboardInsert",vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
	         session.close();
		   }
	   }
	   public static ntboardVO NtboardContentData(int no)
	   {
		   SqlSession session=ssf.openSession();
		   
		   session.update("NtboardHitIncrement",no);
		   session.commit();
		   ntboardVO vo=session.selectOne("NtboardContentData",no);
		   session.close();
		   return vo;
	   }
	   public static ntboardVO NtboardUpdateData(int no)
	   {
		   ntboardVO vo=new ntboardVO();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   vo=session.selectOne("NtboardContentData", no);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	   public static void NtboardUpdate(ntboardVO vo)
	   {
		   SqlSession session=ssf.openSession();
				 try
				 {
					 
					 session.update("NtboardUpdate",vo);
					 session.commit();
				     session.rollback();
				 }
				 catch(Exception ex)
				 {
					 ex.printStackTrace();
				 }
				 finally
				 {
					 if(session!=null)
					 session.close(); 
				 }
	   }
	   public static void NtboardDelete(int no)
	   {
		   SqlSession session=ssf.openSession();
		   try
		   {
				   session.delete("NtboardDelete",no);
				   session.commit();
			 
		   }catch(Exception ex)
		   {
			   session.rollback();
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
}
