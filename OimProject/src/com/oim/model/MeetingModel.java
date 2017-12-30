package com.oim.model;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oim.controller.Controller;
import com.oim.controller.RequestMapping;
import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;
import com.oim.member.dao.MemberVO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

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
						
						System.out.println("totalpage: "+totalpage);
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
						System.out.println("totalpage: "+totalpage);
					}
					req.setAttribute("totalpage", totalpage);
					req.setAttribute("curpage", curpage);
			     	req.setAttribute("list", list);
					req.setAttribute("main_jsp", "../meeting/meeting_find.jsp");
		            
		return "main/main.jsp";
	}
	
    @RequestMapping("meeting_detail.do")
    public String meeting_detail(HttpServletRequest req, HttpServletResponse res) {
       String meet_no = req.getParameter("meet_no");
       
       MeetingVO vo = MeetingDAO.meetingDetailData(Integer.parseInt(meet_no));
       
       req.setAttribute("vo", vo);
       

       req.setAttribute("main_jsp", "../meeting/meeting_detail.jsp");
       return "main/main.jsp";
    }
    //멍미
    @RequestMapping("meeting_payment.do")
    public String meeting_payment(HttpServletRequest req, HttpServletResponse res) {
    	String meet_no = req.getParameter("meet_no");
    	String om_id = req.getParameter("om_id");
    	//System.out.println(om_id);
    	//System.out.println("meet_no:"+meet_no);
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
    	

    	    String clientId = "_meOdew7lewhDIHb1HpK";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "T7NOHRhl3A";//애플리케이션 클라이언트 시크릿값";
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
    
    @RequestMapping("meeting_insert_ok.do") //모임개설완료
    public String meeting_insertOK(HttpServletRequest req, HttpServletResponse res) throws Throwable{

    	req.setCharacterEncoding("UTF-8");
    	HttpSession session=req.getSession();
    	String meet_cg=req.getParameter("meet_cg"); //카테고리
    	/*String poster=req.getParameter("meet_poster");*/ //포스터
     	String om_id=(String)session.getAttribute("id"); //id (로그인정보 세션에서 받아오기)
    	String meet_subject=req.getParameter("meet_subject"); //제목
    	String meet_date=req.getParameter("meet_date"); //모임날짜
    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1); //잘라서 시작날짜 나누기
    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2); //잘라서 종료날짜 나누기
    	String meet_loc1=req.getParameter("meet_loc1"); //주소
    	String meet_loc2=req.getParameter("meet_loc2"); ///상세주소
    	String meet_charge=req.getParameter("meet_charge"); //유/무료 여부
    	String meet_total=req.getParameter("meet_total"); //정원
    	String meet_limit=req.getParameter("meet_total");//신청가능인원 => 처음 만들때 신청가능인원은 정원과 같다
    	String meet_price=req.getParameter("meet_price"); //참여비용
    	String meet_lat=req.getParameter("meet_lat");//위도
    	String meet_lng=req.getParameter("meet_lng");//경도
    	String meet_info=req.getParameter("meet_info"); //모임내용
    	String meet_detail=req.getParameter("meet_detail"); //상세정보
    	
    	MeetingVO vo=new MeetingVO();
    	vo.setMeet_cg(meet_cg);
//    	vo.setMeet_poster(meet_poster);
    	vo.setOm_id(om_id);
    	vo.setMeet_subject(meet_subject);
    	vo.setMeet_start(meet_start);
    	vo.setMeet_end(meet_end);
    	if(meet_loc1.equals("") && meet_loc2.equals("")) { //입력된 모임장소가 없을때
    		vo.setMeet_loc("미정이거나 등록된 모임장소가 없습니다");
    	}else {												//입력된 모임장소가 있을때
    		vo.setMeet_loc(meet_loc1+" "+meet_loc2); 
    	}
    	vo.setMeet_charge(meet_charge);
    	vo.setMeet_total(Integer.parseInt(meet_total));
    	vo.setMeet_limit(Integer.parseInt(meet_limit));
    	vo.setMeet_price(Integer.parseInt(meet_price));
    	vo.setMeet_lat(meet_lat);
    	vo.setMeet_lng(meet_lng);
    	vo.setMeet_info(meet_info);
    	vo.setMeet_detail(meet_detail);
    	
    	
//    	MeetingDAO.meetingInsertOk(vo); //모임개설하기
    	
    	System.out.println("모임 카테고리: "+meet_cg);
    	/*System.out.println("모임 포스터:" + poster);*/
    	System.out.println("개설자ID: "+om_id);
    	System.out.println("모임 제목: "+meet_subject);
    	System.out.println("모임일시: "+meet_date);
    	System.out.println("시작날짜: "+meet_start);
    	System.out.println("종료날짜: "+meet_end);
    	System.out.println("주소: "+meet_loc1);
    	System.out.println("상세주소: "+meet_loc2);
    	System.out.println("유/무료여부: "+meet_charge);
    	System.out.println("모임정원: "+meet_total);
    	System.out.println("참가비용: "+meet_price);
    	System.out.println("위도: "+meet_lat);
    	System.out.println("경도: "+meet_lng);
    	System.out.println("모임소개: "+meet_info);
    	System.out.println("상세내용: "+meet_detail);
    	
    	
    	req.setAttribute("main_jsp","../meeting/meeting_insert_ok.jsp");
    	return "main/main.jsp";		
    	
    }
    
}
