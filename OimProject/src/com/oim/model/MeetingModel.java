package com.oim.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetReplyDAO;
import com.oim.meeting.dao.MeetReplyVO;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;
import com.oim.member.dao.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@Controller
public class MeetingModel {
	@RequestMapping("meeting_list.do") //모임목록
	public String meeting_list(HttpServletRequest req, HttpServletResponse res) {
		String page=req.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start= (rowSize*curpage)-(rowSize-1);
		int end= rowSize*curpage; 
		int totalpage=0;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<MeetingVO> list=MeetingDAO.meetingListData(map);
		totalpage=MeetingDAO.meetingTotalPage();
		
		//jsp로 전송
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		
		req.setAttribute("main_jsp", "../meeting/meeting_list.jsp");
		return "main/main.jsp";
	}
	

	@RequestMapping("meeting_find.do") //모임검색결과
	public String meeting_find(HttpServletRequest req, HttpServletResponse res) throws Throwable{
			req.setCharacterEncoding("UTF-8");
			
			String page=req.getParameter("page");
			boolean first=false;
			if(page==null) {
				page="1";
				first=true;
			}
			
				int curpage=Integer.parseInt(page);
				int rowSize=12;
				int start= (rowSize*curpage)-(rowSize-1);
				int end= rowSize*curpage;
				int totalpage=0;
				
				String categoryTemp[]= req.getParameterValues("category"); //카테고리
				String locTemp[]= req.getParameterValues("loc"); //지역
				String weekTemp[]= req.getParameterValues("week"); //주중or주말
				String priceTemp[]= req.getParameterValues("price");//참여비용
				
				
				List<String> category= new ArrayList<String>();
				List<String> loc= new ArrayList<String>();
				List<String> week= new ArrayList<String>();
				List<String> price= new ArrayList<String>();
				
				
				String from=req.getParameter("from");//시작일 ~부터
				String to=req.getParameter("to");//시작일 ~까지
				
				
				if(categoryTemp!=null) {
					for(String s:categoryTemp) {
						category.add(s);
						System.out.print("카테고리: "+s+" ");
						}
						System.out.println();
					}
					
					if(locTemp!=null) {
					for(String s:locTemp) {
						loc.add(s);
						System.out.print("지역: "+s+" ");
					}
						System.out.println();
					}
					
					if(weekTemp!=null) {
					for(String s:weekTemp) {
						week.add(s);
						System.out.print("주중or주말?: "+s+" ");
					}
					System.out.println();
					}
					
					if(priceTemp!=null) {
					for(String s:priceTemp) {
						price.add(s);
						System.out.print("참여비용: "+s+" ");
					}
					System.out.println();
					}
					
					System.out.println(from);
					System.out.println(to);
					
					Map map=new HashMap();
					map.put("category", category);
					map.put("loc", loc);
					map.put("week", week);
					map.put("price", price);
					map.put("from", from);
					map.put("to", to);
					map.put("start", start);
					map.put("end", end);
					
					List<MeetingVO> list=MeetingDAO.meetingFindData(map);
					totalpage=MeetingDAO.meetingFindTotalPage(map);
							
					
					//jsp로 전송
					HttpSession session=req.getSession();
					if(first==true) //최초로 실행했을때는 session에 저장한다.
					{
						session.setAttribute("category", category);
						session.setAttribute("loc", loc);
						session.setAttribute("week", week);
						session.setAttribute("price", price);
						session.setAttribute("from", from);
						session.setAttribute("to", to);
					}
					else //페이지를 옮겨갈 경우에는 map에 메모리를 새로 할당해서 session에 저장된 검색결과를 넣는다.
					{
						map=new HashMap();
						map.put("category", session.getAttribute("category"));
						map.put("loc", session.getAttribute("loc"));
						map.put("week", session.getAttribute("week"));
						map.put("price", session.getAttribute("price"));
						map.put("from", session.getAttribute("from"));
						map.put("to", session.getAttribute("to"));
						map.put("start", start);
						map.put("end", end);
						list=MeetingDAO.meetingFindData(map);
						totalpage=MeetingDAO.meetingFindTotalPage(map);
					}
					req.setAttribute("totalpage", totalpage);
					req.setAttribute("curpage", curpage);
			     	req.setAttribute("list", list);
					req.setAttribute("main_jsp", "../meeting/meeting_find.jsp");
		            
		return "main/main.jsp";
	}
	
	
    @RequestMapping("meeting_detail.do")
    public String meeting_detail(HttpServletRequest req, HttpServletResponse res) {
       String no = req.getParameter("meet_no");
       int meet_no = Integer.parseInt(no);
       
       HttpSession session = req.getSession();
       
       
       MeetingVO vo = MeetingDAO.meetingDetailData(meet_no);
       
       List<MeetReplyVO> list = MeetReplyDAO.replyListData(meet_no);
       String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
       
       req.setAttribute("today", today);
       req.setAttribute("list", list);
       req.setAttribute("vo", vo);
       
       req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
       return "main/main.jsp";
    }
    //멍미
    @RequestMapping("meeting_payment.do")
    public String meeting_payment(HttpServletRequest req, HttpServletResponse res) {
    	String meet_no = req.getParameter("meet_no");
    	String om_id = req.getParameter("om_id");
    	MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
    	MemberVO vo2 = MeetingDAO.meetingDetailInfo(om_id);
    	
    	req.setAttribute("vo2", vo2);
        req.setAttribute("vo", vo);
        
        req.setAttribute("meeting_payment.do", "meeting_payment.jsp");
    	return "meeting/meeting_payment.jsp";
    }
    
    
    @RequestMapping("meeting_insert.do")//모임개설 입력화면
    public String meeting_insert(HttpServletRequest req, HttpServletResponse res) {
    	
    	HttpSession session=req.getSession();
    	MemberVO vo=MeetingDAO.meetingDetailInfo((String)session.getAttribute("id"));
    	
    	
    	req.setAttribute("vo", vo);
    	req.setAttribute("main_jsp", "../meeting/meeting_insert.jsp");
    	return "main/main.jsp";
    }
    
    @RequestMapping("loc_search.do")//모임장소 지역검색
    public String loc_search(HttpServletRequest req, HttpServletResponse res) {
    	    String clientId="_meOdew7lewhDIHb1HpK";//애플리케이션 클라이언트 아이디값";
	        String clientSecret="T7NOHRhl3A";//애플리케이션 클라이언트 시크릿값";
	        String search=req.getParameter("search");
	        
	        try {

	            String text = URLEncoder.encode(search, "UTF-8");
	            String apiURL="https://openapi.naver.com/v1/search/local?display=10&query="+text;
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine+"\n");
	            }
	            br.close();
	            
	            String json = response.toString();
	            JSONParser jp = new JSONParser();
	            JSONObject obj = (JSONObject)jp.parse(json);
	            JSONArray arr=(JSONArray)obj.get("items");
	            

	            List<MeetingVO> list=new ArrayList<MeetingVO>(); 
	            

	            // 괄호나 이상한 문자를 처리할때
	            for(int i=0; i<arr.size(); i++) {
	            	JSONObject jo = (JSONObject)arr.get(i);
	            	String title = (String)jo.get("title");
	            	String address = (String)jo.get("address");
	            	String mapx = (String)jo.get("mapx");
	            	String mapy = (String)jo.get("mapy");
	            		
	            		title=title.replace("<b>", "");
	    	            title=title.replace("</b>", "");
	            
	    	        MeetingVO vo = new MeetingVO();         
	            	vo.setMeet_loc("["+title+"] "+address);
	            	vo.setMeet_lat(mapx);
	            	vo.setMeet_lng(mapy);
	            	list.add(vo);
	            }
	            

	            req.setAttribute("list", list);
  
	        } catch (Exception e) {
	            System.out.println(e);
	        }
    	
    	
    	return "meeting/loc_search.jsp";
    }
    
//    public static void main(String args[]) {
//    	 File file = new File("c:\\git\\OimWeb\\OimProject\\WebContent\\img\\meetImg\\121999.jpg");
//         
//         if( file.exists() ){
//             if(file.delete()){
//                 System.out.println("파일삭제 성공");
//             }else{
//                 System.out.println("파일삭제 실패");
//             }
//         }else{
//             System.out.println("파일이 존재하지 않습니다.");
//         }
//    }
    
    @RequestMapping("meeting_insert_ok.do") //모임개설완료
    public String meeting_insertOK(HttpServletRequest req, HttpServletResponse res){

    	try {
    		req.setCharacterEncoding("UTF-8"); // 한글 파일명을 고려하여 setcharencoding을 설정해준다.
    		HttpSession session=req.getSession();
			String path = "c:\\git\\OimWeb\\OimProject\\WebContent\\img\\meetImg"; // 경로명
			int size = 1024 * 1024 * 100; // 100MB까지 가능으로 설정
			String enctype = "UTF-8";
			// 파일 업로드하는 라이브러리 (defaultfilerenamepolicy는 안붙여도되지만 붙여주는게 좋다)
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy() : 파일명이 동일할때 파일명을 자동으로 변경
			// Ex) a.jpg => a1.jpg => a2.jpg

			// 파일의 값을 받아올 때 mr을 통해서 받아온다.
	    	String meet_cg=mr.getParameter("meet_cg"); //카테고리
	     	String om_id=(String)session.getAttribute("id"); //id (로그인정보 세션에서 받아오기)
	    	String meet_subject=mr.getParameter("meet_subject"); //제목
	    	String meet_date=mr.getParameter("meet_date"); //모임날짜
	    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1); //잘라서 시작날짜 나누기
	    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2); //잘라서 종료날짜 나누기
	    	String meet_loc1=mr.getParameter("meet_loc1"); //주소
	    	String meet_loc2=mr.getParameter("meet_loc2"); ///상세주소
	    	String meet_charge=mr.getParameter("meet_charge"); //유/무료 여부
	    	String meet_total=mr.getParameter("meet_total"); //정원
	    	String meet_limit=mr.getParameter("meet_total");//신청가능인원 => 처음 만들때 신청가능인원은 정원과 같다
	    	String meet_price=mr.getParameter("meet_price"); //참여비용
	    	String meet_lat=mr.getParameter("meet_lat");//위도
	    	String meet_lng=mr.getParameter("meet_lng");//경도
	    	String meet_info=mr.getParameter("meet_info"); //모임내용
	    	String meet_detail=mr.getParameter("meet_detail"); //상세정보
	    	
	    	MeetingVO vo=new MeetingVO();
	    	vo.setMeet_cg(meet_cg);
	    	vo.setOm_id(om_id);
	    	vo.setMeet_subject(meet_subject);
	    	vo.setMeet_start(meet_start);
	    	vo.setMeet_end(meet_end);
	    	if(meet_loc1.equals("") && meet_loc2.equals("")) { //입력된 모임장소가 없을때
	    		vo.setMeet_loc("미정이거나 등록된 모임장소가 없습니다");
	    	}else if(!(meet_loc1.equals("")) && !(meet_loc2.equals(""))){//주소 , 상세주소 둘다 입력되어있을때
	    		vo.setMeet_loc(meet_loc1+" "+meet_loc2);
	    	}else { //하나만 입력되어있을때
	    		vo.setMeet_loc(meet_loc1);
	    	}
	    	vo.setMeet_charge(meet_charge);
	    	vo.setMeet_total(Integer.parseInt(meet_total));
	    	vo.setMeet_limit(Integer.parseInt(meet_limit));
	    	vo.setMeet_price(Integer.parseInt(meet_price));
	    	if(meet_lat==null && meet_lng==null){
	    		vo.setMeet_lat("");
		    	vo.setMeet_lng("");
	    	}else {
	    	vo.setMeet_lat(meet_lat);
	    	vo.setMeet_lng(meet_lng);
	    	}
	    	vo.setMeet_info(meet_info);
	    	vo.setMeet_detail(meet_detail);
	    	
	    	
			// upload => insert.jsp의 input타입의 이름
	    	int meet_no=MeetingDAO.getMeetingNumber();
	    	vo.setMeet_no(meet_no);
	    	String realname=Integer.toString(meet_no);
			String filename = mr.getFilesystemName("upload");
			
//			System.out.println("모임번호: "+meet_no);
//			System.out.println("모임 카테고리: "+meet_cg);
//	    	System.out.println("개설자ID: "+om_id);
//	    	System.out.println("모임 제목: "+meet_subject);
//	    	System.out.println("시작날짜: "+meet_start);
//	    	System.out.println("종료날짜: "+meet_end);
//	    	System.out.println("주소: "+vo.getMeet_loc());
//	    	System.out.println("유/무료여부: "+meet_charge);
//	    	System.out.println("모임정원: "+meet_total);
//	    	System.out.println("참가비용: "+meet_price);
//	    	System.out.println("위도: "+meet_lat);
//	    	System.out.println("경도: "+meet_lng);
//	    	System.out.println("모임소개: "+meet_info);
//	    	System.out.println("상세내용: "+meet_detail);

			// 파일저장
			if (filename != null) {
				File f = new File(path+"\\"+filename);
				File f2 = new File(path+"\\"+realname+f.getName().substring(f.getName().indexOf('.')));

				f.renameTo(f2);
		    	vo.setMeet_poster("img/meetImg/"+f2.getName());
		    	System.out.println("이미지경로:"+vo.getMeet_poster());
			}
			
	    	MeetingDAO.meetingInsert(vo); //모임개설하기
	    	
    	}catch(Exception ex) {
    		System.out.println("meeting_insert_ok: "+ex.getMessage());
    		ex.printStackTrace();
    	}
    	
    	req.setAttribute("main_jsp","../meeting/meeting_insert_ok.jsp");
    	return "main/main.jsp";		
    }
    
    @RequestMapping("meeting_update.do")
    public String meeting_Update(HttpServletRequest req, HttpServletResponse res) { //모임수정화면
    	String meet_no=req.getParameter("meet_no");
    	MeetingVO vo=MeetingDAO.meetingUpdateData(Integer.parseInt(meet_no));
    	Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		
		req.setAttribute("today", today); //오늘날짜
    	req.setAttribute("vo",vo);
    	return "meeting/meeting_update.jsp";
    }
    
    @RequestMapping("meeting_update_ok.do") //모임수정완료
    public String meeting_update_ok(HttpServletRequest req, HttpServletResponse res) {
    	
    	try {
    		req.setCharacterEncoding("UTF-8"); // 한글 파일명을 고려하여 setcharencoding을 설정해준다.
			String path = "c:\\git\\OimWeb\\OimProject\\WebContent\\img\\meetImg"; // 경로명
			int size = 1024 * 1024 * 100; // 100MB까지 가능으로 설정
			String enctype = "UTF-8";
			// 파일 업로드하는 라이브러리 (defaultfilerenamepolicy는 안붙여도되지만 붙여주는게 좋다)
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy() : 파일명이 동일할때 파일명을 자동으로 변경
			// Ex) a.jpg => a1.jpg => a2.jpg

			// 파일의 값을 받아올 때 mr을 통해서 받아온다.
			String meet_no=mr.getParameter("meet_no");
	    	String meet_cg=mr.getParameter("meet_cg"); //카테고리
	    	String meet_reposter=mr.getParameter("meet_poster");
	    	String meet_poster=meet_reposter.substring(meet_reposter.lastIndexOf("/")+1);
	    	String meet_subject=mr.getParameter("meet_subject"); //제목
	    	String meet_date=mr.getParameter("meet_date"); //모임날짜
	    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1); //잘라서 시작날짜 나누기
	    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2); //잘라서 종료날짜 나누기
	    	String meet_loc1=mr.getParameter("meet_loc1"); //주소
	    	String meet_loc2=mr.getParameter("meet_loc2"); ///상세주소
	    	String meet_charge=mr.getParameter("meet_charge"); //유/무료 여부
	    	String meet_total=mr.getParameter("meet_total"); //정원
	    	String meet_limit=mr.getParameter("meet_limit"); //현재 신청가능인원
	    	String meet_price=mr.getParameter("meet_price"); //참여비용
	    	String meet_lat=mr.getParameter("meet_lat");//위도
	    	String meet_lng=mr.getParameter("meet_lng");//경도
	    	String meet_info=mr.getParameter("meet_info"); //모임내용
	    	String meet_detail=mr.getParameter("meet_detail"); //상세정보
	    	
	    	MeetingVO vo=new MeetingVO();
	    	vo.setMeet_no(Integer.parseInt(meet_no));
	    	vo.setMeet_cg(meet_cg);
	    	vo.setMeet_subject(meet_subject);
	    	vo.setMeet_start(meet_start);
	    	vo.setMeet_end(meet_end);
	    	
	    	if(meet_loc1.equals("") && meet_loc2.equals("")) { //입력된 모임장소가 없을때
	    		vo.setMeet_loc("미정이거나 등록된 모임장소가 없습니다");
	    	}else if(!(meet_loc1.equals("")) && !(meet_loc2.equals(""))){//주소 , 상세주소 둘다 입력되어있을때
	    		vo.setMeet_loc(meet_loc1+" "+meet_loc2);
	    	}else {//하나만 입력되어있을때
	    		vo.setMeet_loc(meet_loc1);
	    	}
	    	vo.setMeet_charge(meet_charge);
	    	vo.setMeet_total(Integer.parseInt(meet_total));
	    	vo.setMeet_limit(Integer.parseInt(meet_limit));
	    	vo.setMeet_price(Integer.parseInt(meet_price));
	    	if(meet_lat==null && meet_lng==null){
	    		vo.setMeet_lat("");
		    	vo.setMeet_lng("");
	    	}else {
		    	vo.setMeet_lat(meet_lat);
		    	vo.setMeet_lng(meet_lng);
	    	}
	    	vo.setMeet_info(meet_info);
	    	vo.setMeet_detail(meet_detail);
	    	
			System.out.println("모임번호: "+meet_no);
			System.out.println("모임 카테고리: "+meet_cg);
			System.out.println("모임 사진이름: "+meet_poster);
	    	System.out.println("모임 제목: "+meet_subject);
	    	System.out.println("시작날짜: "+meet_start);
	    	System.out.println("종료날짜: "+meet_end);
	    	System.out.println("주소: "+vo.getMeet_loc());
	    	System.out.println("유/무료여부: "+meet_charge);
	    	System.out.println("모임정원: "+meet_total);
	    	System.out.println("모임신청가능인원: "+meet_limit);
	    	System.out.println("참가비용: "+meet_price);
	    	System.out.println("위도: "+meet_lat);
	    	System.out.println("경도: "+meet_lng);
	    	System.out.println("모임소개: "+meet_info);
	    	System.out.println("상세내용: "+meet_detail);
	    	
	    	if(meet_reposter!="") { //모임사진을 수정했을시에만 원래있던사진을 삭제 후 저장한다.
				File dfile = new File(path+"\\"+meet_poster); //저장되어있던 사진은 삭제한다.
				if( dfile.exists() ){
		             if(dfile.delete()){
		                 System.out.println("파일삭제 성공");
		             }else{
		                 System.out.println("파일삭제 실패");
		             }
		         }else{
		             System.out.println("파일이 존재하지 않습니다.");
		         }
				
				String realname=meet_no; //삭제후 등록한 새로운 파일을 생성한다.
				String filename = mr.getFilesystemName("upload");
				if (filename != null) {
					File f = new File(path+"\\"+filename);
					File f2 = new File(path+"\\"+realname+f.getName().substring(f.getName().indexOf('.')));

					f.renameTo(f2);
			    	vo.setMeet_poster("img/meetImg/"+f2.getName());
			    	System.out.println("이미지경로:"+vo.getMeet_poster());
				}
	    	}else {
	    		vo.setMeet_poster(meet_reposter);
		    	System.out.println("이미지경로:"+vo.getMeet_poster());
	    	}

	    	MeetingDAO.meetingUpdate(vo);
    	}catch(Exception ex) {
    		System.out.println(ex.getMessage());
    		ex.printStackTrace();
    	}
    	return "Oim_meetpage.do";
    }
    
    @RequestMapping("meeting_search.do") //모임검색결과
	public String meeting_search(HttpServletRequest req, HttpServletResponse res) throws Throwable{
			req.setCharacterEncoding("UTF-8");
			
			String searchText=req.getParameter("searchText"); //검색어 받아오기
			String page=req.getParameter("page");
			boolean first=false;
			if(page==null) {
				page="1";
				first=true;
			}
				int curpage=Integer.parseInt(page);
				int rowSize=12;
				int start= (rowSize*curpage)-(rowSize-1);
				int end= rowSize*curpage;
				int total=0;
				int totalpage=0;
					Map map=new HashMap();
					map.put("start", start);
					map.put("end", end);
					List<MeetingVO> list=new ArrayList<MeetingVO>();
					List<Map> mlist=new ArrayList<Map>(); //모임전체갯수, 전체페이지수 구해오기 위한 HashMap
					
					//jsp로 전송
					HttpSession session=req.getSession();
					if(first==true) //최초로 실행했을때는 session에 저장한다.
					{
						map.put("searchText", searchText);
						session.setAttribute("searchText", searchText);
						list=MeetingDAO.meetingSearchData(map);
						
						mlist=MeetingDAO.meetingSearchTotalPage(searchText);
						total=(int)mlist.get(0).get("total");
						totalpage=(int)mlist.get(0).get("totalpage");
					}
					else //페이지를 옮겨갈 경우에는 map에 메모리를 새로 할당해서 session에 저장된 검색결과를 넣는다.
					{
						map=new HashMap();
						map.put("searchText", session.getAttribute("searchText"));
						map.put("start", start);
						map.put("end", end);
						list=MeetingDAO.meetingSearchData(map);
						
						mlist=MeetingDAO.meetingSearchTotalPage(searchText);
						total=(int)mlist.get(0).get("total");
						totalpage=(int)mlist.get(0).get("totalpage");
					}
					req.setAttribute("total", total);
					req.setAttribute("totalpage", totalpage);
					req.setAttribute("curpage", curpage);
			     	req.setAttribute("list", list);
					req.setAttribute("main_jsp", "../meeting/meeting_search.jsp");
		            
		return "main/main.jsp";
	}
    
}
