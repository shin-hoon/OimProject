package com.oim.fbboard.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;






public class fbBoardDAO {
	private static SqlSessionFactory ssf;
	   static
	   {
		  try
		  {
			  Reader reader=Resources.getResourceAsReader("Config.xml");
			  ssf=new SqlSessionFactoryBuilder().build(reader);
		  }catch(Exception ex)
		  {
			  System.out.println(ex.getMessage());
		  }
	   }
	   public static List<fbBoardVO> fbboardListData(Map map)
	   {
		   List<fbBoardVO> list=new ArrayList<fbBoardVO>();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   list=session.selectList("fbboardListData", map);
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
	   public static int fbboardReplyCount(int bno)
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   count=session.selectOne("fbboardReplyCount", bno);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return count;
	   }
	   // 내용보기
	   public static fbBoardVO fbboardContentData(int no)
	   {
		   fbBoardVO vo=new fbBoardVO();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   session.update("fbboardHitIncrement",no);
			   session.commit();
			   vo=session.selectOne("fbboardContentData", no);
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
	   public static fbBoardVO fbboardUpdateData(int no)
	   {
		   fbBoardVO vo=new fbBoardVO();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   vo=session.selectOne("fbboardContentData", no);
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
	   public static List<replyVO> fbreplyListData(Map map)
	   {
		   List<replyVO> list=new ArrayList<replyVO>();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   list=session.selectList("fbreplyListData", map);
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
	   public static int fbboardTotalPage()
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   total=session.selectOne("fbboardTotalPage");
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	   public static void fbboardInsert(fbBoardVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.insert("fbboardInsert",vo);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   // 새로운 댓글 올리기
	   public static void fbreplyNewInsert(replyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.insert("fbreplyNewInsert",vo);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   // 댓글 상위 게시물의 데이터 읽기 (group_id,group_step,group_tab)
	   public static replyVO fbreplyGetParentInfo(int no)
	   {
		   replyVO vo=new replyVO();
		   SqlSession session=ssf.openSession();
		   try
		   {
			   vo=session.selectOne("fbreplyGetParentInfo", no);
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
	   // replyStepIncrement
	   public static void fbreplyStepIncrement(replyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.update("fbreplyStepIncrement",vo);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   // replyRepyInsert
	   public static void fbreplyRepyInsert(replyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			  session.insert("fbreplyRepyInsert",vo);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   // replyDepthIncrement
	   public static void fbreplyDepthIncrement(int no)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.update("fbreplyDepthIncrement",no);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   public static void fbreplyUpdate(replyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.update("fbreplyUpdate",vo);
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   public static void fbreplyDelete(int no)
	   {
		   SqlSession session=ssf.openSession();
		   try
		   {
			   replyVO vo=session.selectOne("fbreplyDeleteData",no);
			   if(vo.getDepth()==0)
			   {
				   session.delete("fbreplyDelete",no);
			   }
			   else
			   {
				   session.update("fbreplyMsgUpdate",no);
			   }
			   session.update("fbreplyDepthDecrement",vo.getRoot());
			   
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
	   // 게시물 삭제
	   public static boolean fbboardDelete(int no,String pwd)
	   {
		   boolean bCheck=false;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   String db_pwd=session.selectOne("fbboardGetPwd", no);
			   if(db_pwd.equals(pwd))
			   {
				   bCheck=true;
				   session.delete("fbboardReplyDelete",no);
				   session.delete("fbboardDelete",no);
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
	   
	   public static boolean fbboardUpdate(fbBoardVO vo)
	   {
		   boolean bCheck=false;
		   SqlSession session=ssf.openSession();
		   try
		   {
			   String db_pwd=session.selectOne("fbboardGetPwd", vo.getNo());
			   if(db_pwd.equals(vo.getPwd()))
			   {
				   bCheck=true;
				   session.update("fbboardUpdate",vo);
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
