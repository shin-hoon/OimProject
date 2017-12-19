package com.oim.qaboard.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class qaboardDAO {
	private Connection conn;
	private PreparedStatement ps;
	// �̸� �����Ǿ��ִ� Ǯ �ȿ��� connection�� �ּ� ���
	public void getConnection() {
		try {
			Context init = new InitialContext();
			//Ž����
			Context c =(Context)init.lookup("java://comp/env");// C����̺� �̸�
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	// ��ȯ
	public void disConnection() {
		try {
			if(ps!=null)
				ps.close();
			if(conn!=null)
				conn.close();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	public List<qaboardVO>  boardListData(int page){
		List<qaboardVO> list = new ArrayList<qaboardVO>();
		try {
			//�ּҾ��
			getConnection();
			int rowSize=10;
			int start=(page*rowSize)-(rowSize-1);
			int end = page * rowSize;
			// �ζ��� �� => Top-N
			String sql = "SELECT qa_no,qa_subject,om_id,qa_regdate,qa_hit,qa_group_tab,num "
					+ "FROM (SELECT qa_no,qa_subject,om_id,qa_regdate,qa_hit,qa_group_tab,rownum as num "
					+ "FROM (SELECT qa_no,qa_subject,om_id,qa_regdate,qa_hit,qa_group_tab "
					+ "FROM qaboard ORDER BY qa_group_id DESC, qa_group_step ASC)) "
					+ "WHERE num BETWEEN "+start+" AND " +end;
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				qaboardVO vo = new qaboardVO();
				vo.setQa_no(rs.getInt(1));
				vo.setQa_subject(rs.getString(2));
				vo.setOm_id(rs.getString(3));
				vo.setQa_regdate(rs.getDate(4));
				vo.setQa_hit(rs.getInt(5));
				vo.setQa_group_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
			
			//�������� ������ ����
		}catch(Exception ex) {
			ex.getMessage();
		}finally {
			//��ȯ
			disConnection();
		}
		return list;
	}
	
	public void boardInsert(qaboardVO vo) { //���� �ۼ� �޼ҵ�
		
		try {
			getConnection();
			String sql ="INSERT INTO qaboard(qa_no,om_id,qa_subject,qa_content,qa_pwd,qa_group_id) "
					+ "VALUES(qaboard_qa_no_seq.nextval,?,?,?,?,(SELECT NVL(MAX(qa_group_id)+1,1) FROM qaboard))";
					//group_id�� �ִ��� �ֵ�, ����  null���̶��(���ʷ� ���� �ۼ��� ��) 1�� �־����.(�������� Ȱ��)
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getOm_id());
			ps.setString(2, vo.getQa_subject());
			ps.setString(3, vo.getQa_content());
			ps.setString(4, vo.getQa_pwd());
			ps.executeUpdate();
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
	}
	
	public int boardTotalPage(){ //�������� �� ��� �޼ҵ�
		int total=0;
		
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10) FROM qaboard";
			/*
			 * ����Ŭ���� �����ϴ� �����Լ� 
			 * COUNT, CEIL(�ø��Լ�), NVL(Null�� �ٸ� ���ڳ� ���ڷ� �ٲ��ִ��Լ�), MAX => �����Լ�
			 * 
			 * 
			 */
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return total;
	}
	
	public int boardRowCount(){
		int total=0;
		
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM qaboard";
			
			
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return total;
	}
	
	public qaboardVO boardContentData(String type, int no) {
		qaboardVO vo = new qaboardVO();
		try{
			getConnection();
			String sql="";
			
			if(type.equals("qa_content")) {
			sql="UPDATE qaboard SET "
					+ "qa_hit=qa_hit+1 "
					+ "WHERE qa_no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
			
			sql="SELECT qa_no,om_id,qa_subject,qa_content,qa_regdate,qa_hit "
					+ "FROM qaboard "
					+ "WHERE qa_no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setQa_no(rs.getInt(1));
			vo.setOm_id(rs.getString(2));
			vo.setQa_subject(rs.getString(3));
			vo.setQa_content(rs.getString(4));
			vo.setQa_regdate(rs.getDate(5));
			vo.setQa_hit(rs.getInt(6));
			rs.close();
			
			
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}finally {
			disConnection();
		}
		return vo;
	}
	
	public void boardReply(int pno, qaboardVO vo){ //�亯�ޱ�
		
		try {
			getConnection();
			conn.setAutoCommit(false); //Ʈ�����(�ϰ�ó��)�� ���� autocommit�� false�� ����
			//1. ���� �Խù��� group_id, group_step, group_tab
			/*	
			 * 	  			gi	gs	gt
			 *  AAAAAA		1	0	0
			 *    =>BBBBBB	1	1	1
			 *    
			 * 
			 * 
			 */
			
			String sql="SELECT qa_group_id, qa_group_step, qa_group_tab "
					+ "FROM qaboard "
					+ "WHERE qa_no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi=rs.getInt(1);
			int gs=rs.getInt(2);
			int gt =rs.getInt(3);
			rs.close();
			ps.close();
			
			//�亯, ����� �ٽ� SQL (!!!!�߿�!!!!)
			sql="UPDATE qaboard SET "
				+"qa_group_step=qa_group_step+1 "
				+ "WHERE qa_group_id=? AND qa_group_step>?";
				/*�׷�ID�� ������ Ŭ���Ѱͺ��� group_step�� ū�͸� 1�� �������Ѷ�, INSERT�ϱ� ���� �������Ѿ��Ѵ�.*/
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			
			/*
			 * 
			 * 				gi	gs	gt	depth
			 *	AAAAA		10	0	0	  4
			 *	 =>KKKKK	10	1	1
			 *	 =>DDDDD	10  2	1 	
			 *   =>BBBBB	10	3	1
			 *     =>CCCCC  10	4	2
			 *   =>OOOOO	10	5	1
			 *   	  
			 *     DDDDD
			 */
			
			//�߰� (�亯)
			
			// �����Խù� ==> depth ����
					sql ="INSERT INTO qaboard(qa_no,om_id,qa_subject,qa_content,qa_pwd,qa_group_id,qa_group_step,qa_group_tab,qa_root) "
							+ "VALUES(qaboard_qa_no_seq.nextval,?,?,?,?,?,?,?,?)";
							//group_id�� �ִ��� �ֵ�, ����  null���̶��(���ʷ� ���� �ۼ��� ��) 1�� �־����.(�������� Ȱ��)
					
					ps=conn.prepareStatement(sql);
					ps.setString(1, vo.getOm_id());
					ps.setString(2, vo.getQa_subject());
					ps.setString(3, vo.getQa_content());
					ps.setString(4, vo.getQa_pwd());
					ps.setInt(5, gi);   
					ps.setInt(6, gs+1); //?
					ps.setInt(7, gt+1); //?
					ps.setInt(8, pno);
					ps.executeUpdate();
					ps.close();
					
					//root�ۿ� depth 1 ���������ֱ�
					sql="UPDATE qaboard SET "
							+ "qa_depth=qa_depth+1 "
							+ "WHERE qa_no=?";
					
					
					ps=conn.prepareStatement(sql);
					ps.setInt(1, pno);
					ps.executeUpdate();
					conn.commit(); //commit�� false�� �س��� sql���� �� ��������� �� commit�� �����ϰڴ�, �ϳ��� �����ϸ� rollback�� �������ؼ��̴�.
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
			try {
				conn.rollback(); //������ ���� �ѹ� ����, ����ó���� �ݵ�� ������Ѵ�.
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}finally{
			try {
				conn.setAutoCommit(true); //Ʈ����� ��� �� �ٽ� autocommit�� true�� �ٲ��־���Ѵ�.
			}catch(SQLException e) {
				e.printStackTrace();	
			}
			
			disConnection();
		}
	}
	
	//�����ϱ� 
	public boolean boardUpdate(qaboardVO vo) {
		boolean bCheck=false;
		
		try{
			getConnection();
			String sql="SELECT qa_pwd FROM qaboard "
					+ "WHERE qa_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getQa_no());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String qa_pwd=rs.getString(1);
			System.out.println(qa_pwd);
			System.out.println(vo.getQa_pwd());
			rs.close();
			ps.close();
			
			if(qa_pwd.equals(vo.getQa_pwd())){
				bCheck=true;
				sql="UPDATE qaboard SET "
						+ "om_id=?,qa_subject=?,qa_content=? "
						+ "WHERE qa_no=?";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1,vo.getOm_id());
				ps.setString(2,vo.getQa_subject());
				ps.setString(3,vo.getQa_content());
				ps.setInt(4,vo.getQa_no());
				ps.executeUpdate();
				//�� ������ ������ finally���� close�ϱ⶧���� close�� �ٿ��� �ʿ䰡����.
			}
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}finally {
			disConnection();
		}
		return bCheck;
	}
	
	public boolean boardDelete(int no, String pwd) {
		
		boolean bCheck=false;
		try {
			getConnection();
			conn.setAutoCommit(false);
			//SQL
			//password
			String sql="SELECT qa_pwd,qa_root,qa_depth "
					+ "FROM qaboard "
					+ "WHERE qa_no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			int qa_root=rs.getInt(2);
			int qa_depth=rs.getInt(3);
			rs.close();
			ps.close();
			
			if(db_pwd.equals(pwd)){
				bCheck=true;
				if(qa_depth==0) {// ����� ���»���
					sql="DELETE FROM qaboard "
							+ "WHERE qa_no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
				}else { //����� �ִ»���
					String msg="�����ڰ� ������ �Խù��Դϴ�.";
					sql="UPDATE qaboard SET "
							+ "qa_subject=?, qa_content=? "
							+ "WHERE qa_no=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setString(2, msg);
					ps.setInt(3, no); 
					ps.executeUpdate();
					ps.close();
				}
					sql="UPDATE qaboard SET "
							+ "qa_depth=qa_depth-1 "
							+ "WHERE qa_no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, qa_root);
					ps.executeUpdate();
			}
			conn.commit();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
			try {
				conn.rollback();
			}catch(Exception e) {
				
			}
		}finally {
			
			try {
				//AutoCommit ���󺹱�
				conn.setAutoCommit(true);
				
			}catch(Exception e) {
				
			}
			//��ȯ
			disConnection();
		}
		return bCheck;
	}
}