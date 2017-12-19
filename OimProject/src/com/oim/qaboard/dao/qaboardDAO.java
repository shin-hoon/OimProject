package com.oim.qaboard.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class qaboardDAO {
	private Connection conn;
	private PreparedStatement ps;
	// 미리 생성되어있는 풀 안에서 connection의 주소 얻기
	public void getConnection() {
		try {
			Context init = new InitialContext();
			//탐색기
			Context c =(Context)init.lookup("java://comp/env");// C드라이브 이름
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	// 반환
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
			//주소얻기
			getConnection();
			int rowSize=10;
			int start=(page*rowSize)-(rowSize-1);
			int end = page * rowSize;
			// 인라인 뷰 => Top-N
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
			
			//페이지를 나누는 과정
		}catch(Exception ex) {
			ex.getMessage();
		}finally {
			//반환
			disConnection();
		}
		return list;
	}
	
	public void boardInsert(qaboardVO vo) { //새글 작성 메소드
		
		try {
			getConnection();
			String sql ="INSERT INTO qaboard(qa_no,om_id,qa_subject,qa_content,qa_pwd,qa_group_id) "
					+ "VALUES(qaboard_qa_no_seq.nextval,?,?,?,?,(SELECT NVL(MAX(qa_group_id)+1,1) FROM qaboard))";
					//group_id의 최댓값을 넣되, 만약  null값이라면(최초로 글을 작성할 시) 1로 넣어줘라.(서브쿼리 활용)
			
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
	
	public int boardTotalPage(){ //총페이지 수 계산 메소드
		int total=0;
		
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10) FROM qaboard";
			/*
			 * 오라클에서 지원하는 내장함수 
			 * COUNT, CEIL(올림함수), NVL(Null을 다른 문자나 숫자로 바꿔주는함수), MAX => 집합함수
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
	
	public void boardReply(int pno, qaboardVO vo){ //답변달기
		
		try {
			getConnection();
			conn.setAutoCommit(false); //트랜잭션(일괄처리)를 위해 autocommit을 false로 지정
			//1. 상위 게시물의 group_id, group_step, group_tab
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
			
			//답변, 댓글의 핵심 SQL (!!!!중요!!!!)
			sql="UPDATE qaboard SET "
				+"qa_group_step=qa_group_step+1 "
				+ "WHERE qa_group_id=? AND qa_group_step>?";
				/*그룹ID가 같으며 클릭한것보다 group_step이 큰것만 1씩 증가시켜라, INSERT하기 전에 증가시켜야한다.*/
			
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
			
			//추가 (답변)
			
			// 상위게시물 ==> depth 증가
					sql ="INSERT INTO qaboard(qa_no,om_id,qa_subject,qa_content,qa_pwd,qa_group_id,qa_group_step,qa_group_tab,qa_root) "
							+ "VALUES(qaboard_qa_no_seq.nextval,?,?,?,?,?,?,?,?)";
							//group_id의 최댓값을 넣되, 만약  null값이라면(최초로 글을 작성할 시) 1로 넣어줘라.(서브쿼리 활용)
					
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
					
					//root글에 depth 1 증가시켜주기
					sql="UPDATE qaboard SET "
							+ "qa_depth=qa_depth+1 "
							+ "WHERE qa_no=?";
					
					
					ps=conn.prepareStatement(sql);
					ps.setInt(1, pno);
					ps.executeUpdate();
					conn.commit(); //commit을 false로 해놓고 sql문을 다 정상실행한 뒤 commit을 실행하겠다, 하나라도 실패하면 rollback을 쓰기위해서이다.
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
			try {
				conn.rollback(); //에러가 날시 롤백 실행, 예외처리를 반드시 해줘야한다.
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}finally{
			try {
				conn.setAutoCommit(true); //트랜잭션 사용 후 다시 autocommit을 true로 바꿔주어야한다.
			}catch(SQLException e) {
				e.printStackTrace();	
			}
			
			disConnection();
		}
	}
	
	//수정하기 
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
				//젤 마지막 문장은 finally에서 close하기때문에 close를 붙여줄 필요가없다.
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
				if(qa_depth==0) {// 댓글이 없는상태
					sql="DELETE FROM qaboard "
							+ "WHERE qa_no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
				}else { //댓글이 있는상태
					String msg="관리자가 삭제한 게시물입니다.";
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
				//AutoCommit 원상복귀
				conn.setAutoCommit(true);
				
			}catch(Exception e) {
				
			}
			//반환
			disConnection();
		}
		return bCheck;
	}
}