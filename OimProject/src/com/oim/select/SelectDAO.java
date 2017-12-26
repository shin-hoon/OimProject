package com.oim.select;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

import java.util.*;
public class SelectDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   private final String URL="jdbc:oracle:thin:@211.238.142.223:1521:ORCL";
	   static public int totalCount = 0;
	   
	   public SelectDAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public void getConnection()
	   {
		   try
		   {
			   conn=DriverManager.getConnection(URL,"scott","1234");
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex) {}
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
	   
	   public List<SelectListVO> saveList(String id,int page,int view){
		   List<SelectListVO> list=new ArrayList<SelectListVO>();
		   
		   try {
			   getConnection();
			   String sql = "SELECT cst_cg,cst_loc,cst_day,cst_price FROM cst_meeting "
					   	  + "WHERE cst_no=? AND om_id=? ";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, view);
			   ps.setString(2, id);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   
			   String cst_cg[]    = rs.getString(1)!=null?rs.getString(1).split(","):new String[0];
			   String cst_loc[]   = rs.getString(2)!=null?rs.getString(2).split(","):new String[0];
			   String cst_day[]   = rs.getString(3)!=null?rs.getString(3).split(","):new String[0];
			   String cst_price[] = rs.getString(4)!=null?rs.getString(4).split(","):new String[0];
			   rs.close();
			   ps.close();
			   
			   int rowSize=20;
			   int start=(page*rowSize)-(rowSize-1);
			   int end=(page*rowSize);
			   sql="SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
			      +"TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),'YY-MM-DD') meet_start,"
			      +"TO_CHAR(to_date(meet_end, 'YYYY-MM-DD HH24:MI'),'YY-MM-DD') meet_end,"
			      +"meet_loc,meet_total,meet_limit,meet_info,"
			   	  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,"
			   	  +"meet_hit,num "
				  +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject," 
				  +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info," 
				  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate," 
				  +"meet_hit,rownum as num "
				  +"FROM (SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
				  +"meet_start,meet_end,meet_loc,meet_total,meet_limit,meet_info,"
				  +"meet_price,meet_like,meet_detail,meet_lat,meet_lng,meet_regdate,meet_hit "
				  +"FROM meeting ORDER BY meet_no DESC)) ";
				  
			   
			   if(cst_cg.length!=0 || cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0) {
				   sql += "WHERE (";
			   }
				   
			   if(cst_cg.length!=0) {
				   for(int i=0;i<cst_cg.length;i++) {
					   if(i==0) sql += " meet_cg LIKE '%'||'"+cst_cg[i]+"'||'%'";
					   else     sql += " OR meet_cg LIKE '%'||'"+cst_cg[i]+"'||'%'";
					   if(i==cst_cg.length-1 && (cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0)) {
						   sql += " ) AND ( ";
					   }
				   }
				   
			   }
			   
			   if(cst_loc.length!=0) {
				   for(int i=0;i<cst_loc.length;i++) {
					   if(i==0)
						   sql += " meet_loc LIKE '%'||'"+cst_loc[i]+"'||'%'";
					   else
						   sql += " OR meet_loc LIKE '%'||'"+cst_loc[i]+"'||'%'";
					   if(i==cst_loc.length-1 && (cst_day.length!=0 || cst_price.length!=0)) {
						   sql += " ) AND ( ";
					   }
				   }
			   }
			   
			   if(cst_day.length!=0) {
				   for(int i=0;i<cst_day.length;i++) {
					   if(i==0) {
						   if(cst_day[i].equals("주중")) {
							   sql += " REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'월|화|수|목|금')";
						   }
						   else {
							   sql += " REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'토|일')";
						   }
					   }
					   else {
						   if(cst_day[i].equals("주중")) {
							   sql += " OR REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'월|화|수|목|금')";
						   }
						   else {
							   sql += " OR REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'토|일')";
						   }
					   }
					   if(i==cst_day.length-1 && cst_price.length!=0) {
						   sql += " ) AND ( ";
					   }
				   }
			   }
			   
			   if(cst_price.length!=0) {
				   for(int i=0;i<cst_price.length;i++) {
					   switch(cst_price[i]) {
					      case "0" : 
					    	  String charge = "무료";
					    	  if(i==0) {
					    		  sql += " (meet_charge LIKE '%'||'"+charge+"'||'%')"; break;
					      	  }
					    	  else {		 
					    		  sql += " OR (meet_charge LIKE '%'||'"+charge+"'||'%')"; break;
					    	  }
					      case "10000" :
					    	  if(i==0) {
					    		  sql += " (meet_price <= 10000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price <= 10000)"; break;
					    	  }
					      case "25000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 10000 AND meet_price <= 25000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 10000 AND meet_price <= 25000)"; break;
					    	  }
					      case "40000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 25000 AND meet_price <= 40000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 25000 AND meet_price <= 40000)"; break;
					    	  }
					      case "99000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 40000 AND meet_price <= 99000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 40000 AND meet_price <= 99000)"; break;
					    	  }
					      case "99001" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 99000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 99000)"; break;
					    	  }
					   }
				   }
			   }
			   
			   if(cst_cg.length!=0 || cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0) {
				   sql += " )";
			   }
			   
			   System.out.println(sql);
			   ps=conn.prepareStatement(sql);
			   rs=ps.executeQuery();
			   int i=1;
			   totalCount = 0;
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
				   totalCount++;
				   if(i>=start && i<=end) {
					   list.add(vo);
				   }
				   i++;
			   }
			   rs.close();
			   ps.close();
		}  catch(Exception e) {
			   System.out.println("saveList : "+e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
		   return list;
	   }
	   
	   
	   public List<SelectSaveVO> saveCheckBox(String id,int cst_no){
		   List<SelectSaveVO> list=new ArrayList<SelectSaveVO>();
		   
		   try {
			   getConnection();
			   String sql = "SELECT cst_no,om_id,cst_subject,cst_cg,"
			   			  + "cst_loc,cst_day,cst_price FROM cst_meeting "
					   	  + "WHERE om_id=? AND cst_no=?";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ps.setInt(2, cst_no);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   
			   SelectSaveVO vo=new SelectSaveVO();
			   vo.setCst_no(rs.getInt(1));
			   vo.setId(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setCst_cg(rs.getString(4));
			   vo.setCst_loc(rs.getString(5));
			   vo.setCst_day(rs.getString(6));
			   vo.setCst_price(rs.getString(7));
			   list.add(vo);
					   
			   rs.close();
			   ps.close();
		}  catch(Exception e) {
			   System.out.println("saveCheckBox : "+e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
		   return list;
	   }
	   
	   
	   public void selectSaveInsert(SelectSaveVO vo, String id, int cst_no) {
		   try {
			   getConnection();
			   String sql = "SELECT COUNT(*) FROM ("
			   			  + "SELECT cst_no FROM cst_meeting "
			   			  + "WHERE om_id = ? AND cst_no = ?)";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, cst_no);
				ResultSet rs = ps.executeQuery();
				rs.next();
				
				int check = rs.getInt(1);
				rs.close();
				ps.close();
					
				if(check==0) {
					sql = "INSERT INTO cst_meeting VALUES("
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
				}
			   else {
				    sql = "UPDATE cst_meeting SET "
					    + "cst_subject=?,cst_cg=?,cst_loc =?,"
					    + "cst_day=?,cst_price=? "
					    + "WHERE cst_no = ? AND om_id = ?";
				   
				    ps = conn.prepareStatement(sql);
				    ps.setString(1, vo.getSubject());
				    ps.setString(2, vo.getCst_cg());
				    ps.setString(3, vo.getCst_loc());
				    ps.setString(4, vo.getCst_day());
				    ps.setString(5, vo.getCst_price());
				    ps.setInt(6, vo.getCst_no());
				    ps.setString(7, vo.getId());
				    ps.executeUpdate();
				   	ps.close(); 	   
			   }	
			   
		   }catch(Exception e) {
			   System.out.println("saveInsert : "+e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
	   }
	   
	   public int saveNo(String id, int num) {
		   int check =0;
			try {
				getConnection();
				String sql = "SELECT COUNT(*) FROM ("
  			   			   + "SELECT cst_no FROM cst_meeting "
			   			   + "WHERE om_id = ? AND cst_no = ?)";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, num);
				ResultSet rs = ps.executeQuery();
				rs.next();
				
				check = rs.getInt(1);
				rs.close();
				ps.close();
				
				if(check==0) return check;
				else return check=num;
				   
			}catch(Exception e) {
				System.out.println("saveNo : "+e.getMessage());
			}
			finally {
				disConnection();
			}
			return check;
		}
	   
	   public void selectSaveDelete(String id, int num) {
			try {
				getConnection();
				String sql = "DELETE FROM cst_meeting "
			   			   + "WHERE om_id = ? AND cst_no = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, num);
				ps.executeUpdate();
				ps.close();
			}catch(Exception e) {
				System.out.println("selectSaveDelete : "+e.getMessage());
			}
			finally {
				disConnection();
			}
		}
	   
	   
	   public int TotalPage() {
			int total=0;
			try {
				getConnection();
				String sql = "SELECT CEIL(COUNT(*)/20) FROM meeting";
				
				ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
				ps.close();
				
				sql = "SELECT COUNT(*) FROM meeting";
				
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				rs.next();
				totalCount=rs.getInt(1);
				rs.close();
				ps.close();
			}catch(Exception e) {
				System.out.println("totalpage : "+e.getMessage());
			}
			finally {
				disConnection();
			}
			return total;
		}
	
	   
	   public int saveTotalPage(String id,int page,int view){
		   int totalpage=1;
		   try {
			   getConnection();
			   String sql = "SELECT cst_cg,cst_loc,cst_day,cst_price FROM cst_meeting "
					   	  + "WHERE cst_no=? AND om_id = ?";
			   ps = conn.prepareStatement(sql);
			   ps.setInt(1, view);
			   ps.setString(2, id);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   
			   String cst_cg[]    = rs.getString(1)!=null?rs.getString(1).split(","):new String[0];
			   String cst_loc[]   = rs.getString(2)!=null?rs.getString(2).split(","):new String[0];
			   String cst_day[]   = rs.getString(3)!=null?rs.getString(3).split(","):new String[0];
			   String cst_price[] = rs.getString(4)!=null?rs.getString(4).split(","):new String[0];
			   rs.close();
			   ps.close();
			   
			   sql="SELECT CEIL(COUNT(*)/20) FROM ("
				  +"SELECT meet_no,meet_charge,meet_cg,meet_poster,om_id,meet_subject,"
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
				  +"FROM meeting ORDER BY meet_no DESC)) ";
			   
			   if(cst_cg.length!=0 || cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0) {
				   sql += "WHERE (";
			   }
				   
			   if(cst_cg.length!=0) {
				   for(int i=0;i<cst_cg.length;i++) {
					   if(i==0) sql += " meet_cg LIKE '%'||'"+cst_cg[i]+"'||'%'";
					   else     sql += " OR meet_cg LIKE '%'||'"+cst_cg[i]+"'||'%'";
					   if(i==cst_cg.length-1 && (cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0)) {
						   sql += " ) AND ( ";
					   }
				   }
				   
			   }
			   
			   if(cst_loc.length!=0) {
				   for(int i=0;i<cst_loc.length;i++) {
					   if(i==0)
						   sql += " meet_loc LIKE '%'||'"+cst_loc[i]+"'||'%'";
					   else
						   sql += " OR meet_loc LIKE '%'||'"+cst_loc[i]+"'||'%'";
					   if(i==cst_loc.length-1 && (cst_day.length!=0 || cst_price.length!=0)) {
						   sql += " ) AND ( ";
					   }
				   }
			   }
			   
			   if(cst_day.length!=0) {
				   for(int i=0;i<cst_day.length;i++) {
					   if(i==0) {
						   if(cst_day[i].equals("주중")) {
							   sql += " REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'월|화|수|목|금')";
						   }
						   else {
							   sql += " REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'토|일')";
						   }
					   }
					   else {
						   if(cst_day[i].equals("주중")) {
							   sql += " OR REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'월|화|수|목|금')";
						   }
						   else {
							   sql += " OR REGEXP_LIKE(TO_CHAR(to_date(meet_start, 'YYYY-MM-DD HH24:MI'),"
								   +  "'DY','NLS_DATE_LANGUAGE=korean'),'토|일')";
						   }
					   }
					   if(i==cst_day.length-1 && cst_price.length!=0) {
						   sql += " ) AND ( ";
					   }
				   }
			   }
			   
			   if(cst_price.length!=0) {
				   for(int i=0;i<cst_price.length;i++) {
					   switch(cst_price[i]) {
					      case "0" : 
					    	  String charge = "무료";
					    	  if(i==0) {
					    		  sql += " (meet_charge LIKE '%'||'"+charge+"'||'%')"; break;
					      	  }
					    	  else {		 
					    		  sql += " OR (meet_charge LIKE '%'||'"+charge+"'||'%')"; break;
					    	  }
					      case "10000" :
					    	  if(i==0) {
					    		  sql += " (meet_price <= 10000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price <= 10000)"; break;
					    	  }
					      case "25000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 10000 AND meet_price <= 25000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 10000 AND meet_price <= 25000)"; break;
					    	  }
					      case "40000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 25000 AND meet_price <= 40000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 25000 AND meet_price <= 40000)"; break;
					    	  }
					      case "99000" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 40000 AND meet_price <= 99000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 40000 AND meet_price <= 99000)"; break;
					    	  }
					      case "99001" : 
					    	  if(i==0) {
					    		  sql += " (meet_price >= 99000)"; break;
					    	  }
					    	  else {
					    		  sql += " OR (meet_price >= 99000)"; break;
					    	  }
					   }
				   }
			   }
			   
			   if(cst_cg.length!=0 || cst_loc.length!=0 || cst_day.length!=0 || cst_price.length!=0) {
				   sql += " )";
			   }
			   
			   
			   sql += ")";
			   System.out.println(sql);
			   ps=conn.prepareStatement(sql);
			   rs=ps.executeQuery();
			   rs.next();
			   totalpage = rs.getInt(1);
			   rs.close();
			   ps.close();
		}  catch(Exception e) {
			System.out.println("saveTotalPage : "+e.getMessage());
		   }
		   finally {
			   disConnection();
		   }
		   return totalpage;
	   }
}