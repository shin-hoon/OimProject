package com.oim.qaboard.dao;

import java.io.*;
import java.util.*;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class qaboardDAO {
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
	   public static List<qaboardVO> boardListData(Map map)
	   {
		   SqlSession session=ssf.openSession();
		   List<qaboardVO> list=null;
		   try
		   {
		      list=session.selectList("boardListData",map);
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
	   
	   public static int boardTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   // session : connection
			   session=ssf.openSession(); //autocommit(false)
			   total=session.selectOne("boardTotalPage");
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
	   public static void boardInsert(qaboardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
		      session.insert("boardInsert",vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
	         session.close();
		   }
	   }
	   public static qaboardVO boardContentData(int no)
	   {
		   SqlSession session=ssf.openSession();
		   
		   session.update("boardHitIncrement",no);
		   session.commit();
		   qaboardVO vo=session.selectOne("boardContentData",no);
		   session.close();
		   return vo;
	   }
	   public static qaboardVO boardUpdateData(int no)
	   {
		   qaboardVO vo=new qaboardVO();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   vo=session.selectOne("boardContentData", no);
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
	   public static boolean boardUpdate(qaboardVO vo)
	   {
		   boolean bCheck=false;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   String db_pwd=session.selectOne("boardGetPwd", vo.getQa_no());
			   if(db_pwd.equals(vo.getQa_pwd()))
			   {
				   bCheck=true;
				   session.update("boardUpdate",vo);
				   session.commit();
			   }
			 
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
		   return bCheck;
	   }
	   public static boolean boardDelete(int no,String pwd)
	   {
		   boolean bCheck=false;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   String db_pwd=session.selectOne("boardGetPwd", no);
			   if(db_pwd.equals(pwd))
			   {
				   bCheck=true;
				   session.delete("boardDelete",no);
				   session.commit();
			   }
			 
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
		   return bCheck;
	   }
}
