package com.oim.meeting.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;


public class MeetReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public static List<MeetReplyVO> replyListData(int meet_no){
		List<MeetReplyVO> list=new ArrayList<MeetReplyVO>();
		SqlSession session = ssf.openSession();
		try {
			list=session.selectList("replyListData",meet_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	//새로운 댓글 올리기
	public static void replyNewInsert(MeetReplyVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.insert("replyNewInsert",vo);
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//댓글 살위 게시물의 데이터를 일기(group_id,group_step,group_tab)
	public static MeetReplyVO replyGetParentInfo(int reply_no) {
		MeetReplyVO vo = new MeetReplyVO();
		SqlSession session = ssf.openSession();
		try {
			vo = session.selectOne("replyGetParentInfo",reply_no);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	//replyStepIncrement
	public static void replyStepIncrement(MeetReplyVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("replyStepIncrement",vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//replyReplyInsert
	public static void replyReplyInsert(MeetReplyVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.insert("replyReplyInsert", vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//replyDepthIncrement
	public static void replyDepthIncrement(int reply_no) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("replyDepthIncrement",reply_no);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	public static void replyUpdate(MeetReplyVO vo) {
		SqlSession session = ssf.openSession(true);
		try {
			session.update("replyUpdate",vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	//트렌젝션
	public static void replyDelete(int no) {
		SqlSession session = ssf.openSession();
		try {
			//replyDeleteData
			MeetReplyVO vo = session.selectOne("replyDeleteData", no);
			if(vo.getReply_depth()==0) {
				session.delete("replyDelete",no);
			}
			else {
				session.update("replyMsgUpdate",no);
			}
			
			//replyDepthDecrement
			session.update("replyDepthDecrement",vo.getReply_root());
			
			session.commit();
			
		} catch (Exception e) {
			session.rollback();
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
}
