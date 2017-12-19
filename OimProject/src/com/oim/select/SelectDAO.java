package com.sist.SelectSave;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import java.util.*;
import java.util.Date;
public class SelectDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   // 미리 생성되어 있는 풀안에서 connection의 주소 얻기
	   public void getConnection()
	   {
		   try
		   {
			   Context init=new InitialContext();
			   // 탐색기 ==> JNDI
			   Context c=(Context)init.lookup("java://comp/env");
			   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			   conn=ds.getConnection();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   // 반환 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public List<SelectListVO> meetingList(int page)
	   {
		   List<SelectListVO> list=new ArrayList<SelectListVO>();
		   try
		   {
			   getConnection();
			   int rowSize=20;
			   int start=(page*rowSize)-(rowSize-1);
			   int end=(page*rowSize);
			   String sql="SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
			   			 +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info,"
			   			 +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,"
			   			 +"meet_hit,num "
					     +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject, " 
					     +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info," 
					     +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate," 
					     +"meet_hit,rownum as num "
					     +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
					     +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info,"
					     +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,meet_hit "
					     +"FROM meeting ORDER BY meet_no DESC)) "
					     +"WHERE num BETWEEN "+start+" AND "+end;
			   
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   SelectListVO vo=new SelectListVO();
				   vo.setMeet_no(rs.getInt(1));
				   vo.setMeet_charge(rs.getString(2));
				   vo.setMeet_cg(rs.getString(3));
				   vo.setMeet_poster(rs.getString(4));
				   vo.setOm_id(rs.getString(5));
				   vo.setMeet_subject(rs.getString(6));
				   vo.setMeet_start(rs.getString(7));
				   vo.setMeet_end(rs.getString(8));
				   vo.setMeet_loc(rs.getString(9));
				   vo.setMeet_total(rs.getInt(10));
				   vo.setMeet_limit(rs.getInt(11));
				   vo.setMeet_info(rs.getString(12));
				   vo.setMeet_price(rs.getInt(13));
				   vo.setMeet_like(rs.getInt(14));
				   vo.setMeet_detail(rs.getString(15));
				   vo.setMeet_lat(rs.getString(16));
				   vo.setMeet_lng(rs.getString(17));
				   vo.setMeet_regdate(rs.getDate(18));
				   vo.setMeet_hit(rs.getInt(19));
				   vo.setRownum(rs.getInt(20));
				   list.add(vo);
			   }
			   rs.close();
			   ps.close();
		   }
		   catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   
	   public List<SelectListVO> saveList(int page,int view){
		   List<SelectListVO> list=new ArrayList<SelectListVO>();
		   
		   try {
			   getConnection();
			   String sql = "SELECT cst_cg,cst_loc,cst_day,cst_price FROM cst_meeting "
					   	  + "WHERE cst_no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, view);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   
			   String cst_cg1[] = rs.getString(1).split(",");
			   String cst_loc1[] = rs.getString(2).split(",");
			   String cst_day1[] = rs.getString(3).split(",");
			   String cst_price1[] = rs.getString(4).split(",");
			   ps.close();
			   rs.close();
//SELECT * FROM meeting WHERE (meet_loc LIKE '%부산%') and (meet_cg LIKE '%세미나%') and (meet_charge LIKE '%무료%');
			  
			   int rowSize=20;
			   int start=(page*rowSize)-(rowSize-1);
			   int end=(page*rowSize);
			   sql="SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
			      +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info,"
			   	  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,"
			   	  +"meet_hit,num "
				  +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject, " 
				  +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info," 
				  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate," 
				  +"meet_hit,rownum as num "
				  +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
				  +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info,"
				  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,meet_hit "
				  +"FROM meeting ORDER BY meet_no DESC)) "
				  +"WHERE rownum BETWEEN "+start+" AND "+end;
//WHERE num BETWEEN 1 AND 100 and  meet_loc LIKE '%서울%' and meet_cg LIKE '%세미나%' and meet_charge LIKE '%무료%';
			   // "WHERE dong LIKE '%'||?||'%' ";
			   if(cst_cg1!=null) {
				   for(int i=0;i<cst_cg1.length;i++) {
					   sql += " AND meet_cg LIKE '%'||'"+cst_cg1[i]+"'||'%'";
					   break;
				   }
			   }
			   
			  /* if(cst_cg1!=null) {
				   for(int i=0;i<cst_cg1.length;i++) {
					   sql += " AND meet_cg LIKE CONCAT(concat('%','"+cst_cg1[i]+"'),'%')";
				   }
			   }*/
			  /* if(cst_loc1!=null) {
				   for(int i=0;i<cst_loc1.length;i++) {
					   sql += " AND meet_loc LIKE '%'||"+cst_loc1[i]+"||'%' ";
				   }
			   }
			   if(cst_day1!=null) {
				   for(int i=0;i<cst_day1.length;i++) {
					   sql += " AND meet_loc LIKE '%'||"+cst_day1[i]+"||'%' ";
				   }
			   }*/
			   String charge = "";
			   if(cst_price1!=null) {
				   for(int i=0;i<cst_price1.length;i++) {
					   if(cst_price1[i].equals("0")) { 
						   charge = "무료";
						   sql += " AND meet_charge LIKE '%'||'"+charge+"'||'%'";
						   break;
					   }
				   }
			   }
			   System.out.println(sql);
			   ps=conn.prepareStatement(sql);
			   rs=ps.executeQuery();
			   while(rs.next())
			   {
				   SelectListVO vo=new SelectListVO();
				   vo.setMeet_no(rs.getInt(1));
				   vo.setMeet_charge(rs.getString(2));
				   vo.setMeet_cg(rs.getString(3));
				   vo.setMeet_poster(rs.getString(4));
				   vo.setOm_id(rs.getString(5));
				   vo.setMeet_subject(rs.getString(6));
				   vo.setMeet_start(rs.getString(7));
				   vo.setMeet_end(rs.getString(8));
				   vo.setMeet_loc(rs.getString(9));
				   vo.setMeet_total(rs.getInt(10));
				   vo.setMeet_limit(rs.getInt(11));
				   vo.setMeet_info(rs.getString(12));
				   vo.setMeet_price(rs.getInt(13));
				   vo.setMeet_like(rs.getInt(14));
				   vo.setMeet_detail(rs.getString(15));
				   vo.setMeet_lat(rs.getString(16));
				   vo.setMeet_lng(rs.getString(17));
				   vo.setMeet_regdate(rs.getDate(18));
				   vo.setMeet_hit(rs.getInt(19));
				   vo.setRownum(rs.getInt(20));
				   list.add(vo);
			   }
			   rs.close();
			   ps.close();
		}  catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   
	   public void selectSaveInsert(SelectSaveVO vo) {
		   try {
			   getConnection();
			   String sql = "INSERT INTO cst_meeting VALUES("
					   	  + "?,?,?,?,?,?,?)";
			
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, vo.getCst_no());
			   ps.setString(2, vo.getId());
			   ps.setString(3, vo.getSubject());
			   ps.setString(4, vo.getCst_cg());
			   ps.setString(5, vo.getCst_loc());
			   ps.setString(6, vo.getCst_day());
			   ps.setString(7, vo.getCst_price());
			   ps.executeUpdate();
			   ps.close();	   
			   
		   }catch(Exception e) {
			   System.out.println(e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
	   }
	   
	   public int saveNo(String id) {
			int no=0;
			try {
				getConnection();
				String sql = "SELECT cst_no FROM cst_meeting WHERE om_id = ?";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					int cst_no = Integer.parseInt(rs.getString(1));
					
					if(cst_no!=0) {
						no = cst_no;
						break;
					}
				}
				rs.close();
				ps.close();
				   
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			finally {
				disConnection();
			}
			return no;
		}
	   
	   
	   public int TotalPage() {
			int total=0;
			try {
				getConnection();
				String sql = "SELECT CEIL(COUNT(*)/20) FROM meeting";
				// CEIL ==> 올림함수  CEIL(COUNT(*)/10)
				ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
				ps.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			finally {
				disConnection();
			}
			return total;
		}
	
	   
	   /*
	   public void databoardInsert(SelectSaveVO vo) {
		   try {
			   getConnection();
			   String sql = "INSERT INTO databoard VALUES("
					   	  + "data_no_seq.nextval,?,?,?,?,SYSDATE,0,?,?,?)";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setString(4, vo.getPwd());
			   ps.setString(5, vo.getFilename());
			   ps.setInt(6, vo.getFilesize());
			   ps.setInt(7, vo.getFilecount());
			   ps.executeUpdate();
					   
		   }catch(Exception e) {
			   System.out.println(e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
	   }
	   */
	   
	   /*
	   public SelectSaveVO databoardCountData(int no) {
		   SelectSaveVO vo = new SelectSaveVO();
		   
		   try {
			   getConnection();
			   String sql = "UPDATE databoard SET "
					      + "hit = hit+1 "
					      + "WHERE no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
			   ps.close();
			   
			   sql = "SELECT no,name,subject,content,regdate, "
				   + "hit,filename,filesize,filecount "
				   + "FROM databoard "
				   + "WHERE no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setRegdate(rs.getDate(5));
			   vo.setFilename(rs.getString(7));
			   vo.setFilesize(rs.getInt(8));
			   vo.setFilecount(rs.getInt(9));
			   rs.close();
			   
		   }catch(Exception e) {
			   System.out.println(e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
		   
		   
		   return vo;
	   }
	   */
	   /*
	   public SelectSaveVO databoardFileInfo(int no) {
		   SelectSaveVO vo = new SelectSaveVO();
		   
		   try {
			   getConnection();
			   String sql = "SELECT filename,filecount "
					   	  + "FROM databoard "
					   	  + "WHERE no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   vo.setFilename(rs.getString(1));
			   vo.setFilecount(rs.getInt(2));
			   rs.close();
			   
		   }catch(Exception e) {
			   System.out.println(e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
		   return vo;
	   }
	   */
	   /*
	   public boolean databoardDelete(int no,String pwd) {
		   boolean bCheck = false;
		   
		   try {
			   getConnection();
			   String sql = "SELECT pwd FROM databoard "
					   	  + "WHERE no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   String db_pwd = rs.getString(1);
			   rs.close();
			   ps.close();
			   
			   if(pwd.equals(db_pwd)) {
				   bCheck = true;
				   sql = "DELETE FROM databoard "
					   + "WHERE no=?";
				   ps = conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
			   }
			   
		   }catch(Exception e) {
			   System.out.println(e.getMessage());
		   }finally {
			   disConnection();
		   }
		   
		   return bCheck;
	   }
	   */
}


















