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
	@RequestMapping("meeting_list.do") //���Ӹ��
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
		
		//jsp�� ����
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", list);
		
		req.setAttribute("main_jsp", "../meeting/meeting_list.jsp");
		return "main/main.jsp";
	}
	

	@RequestMapping("meeting_find.do") //���Ӱ˻����
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
				
				String categoryTemp[]= req.getParameterValues("category"); //ī�װ�
				String locTemp[]= req.getParameterValues("loc"); //����
				String weekTemp[]= req.getParameterValues("week"); //����or�ָ�
				String priceTemp[]= req.getParameterValues("price");//�������
				
				
				List<String> category= new ArrayList<String>();
				List<String> loc= new ArrayList<String>();
				List<String> week= new ArrayList<String>();
				List<String> price= new ArrayList<String>();
				
				
				String from=req.getParameter("from");//������ ~����
				String to=req.getParameter("to");//������ ~����
				
				
				if(categoryTemp!=null) {
					for(String s:categoryTemp) {
						category.add(s);
						System.out.print("ī�װ�: "+s+" ");
						}
						System.out.println();
					}
					
					if(locTemp!=null) {
					for(String s:locTemp) {
						loc.add(s);
						System.out.print("����: "+s+" ");
					}
						System.out.println();
					}
					
					if(weekTemp!=null) {
					for(String s:weekTemp) {
						week.add(s);
						System.out.print("����or�ָ�?: "+s+" ");
					}
					System.out.println();
					}
					
					if(priceTemp!=null) {
					for(String s:priceTemp) {
						price.add(s);
						System.out.print("�������: "+s+" ");
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
							
					
					//jsp�� ����
					HttpSession session=req.getSession();
					if(first==true) //���ʷ� ������������ session�� �����Ѵ�.
					{
						session.setAttribute("category", category);
						session.setAttribute("loc", loc);
						session.setAttribute("week", week);
						session.setAttribute("price", price);
						session.setAttribute("from", from);
						session.setAttribute("to", to);
					}
					else //�������� �Űܰ� ��쿡�� map�� �޸𸮸� ���� �Ҵ��ؼ� session�� ����� �˻������ �ִ´�.
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
    //�۹�
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
    
    
    @RequestMapping("meeting_insert.do")//���Ӱ��� �Է�ȭ��
    public String meeting_insert(HttpServletRequest req, HttpServletResponse res) {
    	
    	HttpSession session=req.getSession();
    	MemberVO vo=MeetingDAO.meetingDetailInfo((String)session.getAttribute("id"));
    	
    	
    	req.setAttribute("vo", vo);
    	req.setAttribute("main_jsp", "../meeting/meeting_insert.jsp");
    	return "main/main.jsp";
    }
    
    @RequestMapping("loc_search.do")//������� �����˻�
    public String loc_search(HttpServletRequest req, HttpServletResponse res) {
    	    String clientId="_meOdew7lewhDIHb1HpK";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	        String clientSecret="T7NOHRhl3A";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
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
	            if(responseCode==200) { // ���� ȣ��
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	            } else {  // ���� �߻�
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
	            

	            // ��ȣ�� �̻��� ���ڸ� ó���Ҷ�
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
//                 System.out.println("���ϻ��� ����");
//             }else{
//                 System.out.println("���ϻ��� ����");
//             }
//         }else{
//             System.out.println("������ �������� �ʽ��ϴ�.");
//         }
//    }
    
    @RequestMapping("meeting_insert_ok.do") //���Ӱ����Ϸ�
    public String meeting_insertOK(HttpServletRequest req, HttpServletResponse res){

    	try {
    		req.setCharacterEncoding("UTF-8"); // �ѱ� ���ϸ��� ����Ͽ� setcharencoding�� �������ش�.
    		HttpSession session=req.getSession();
			String path = "c:\\git\\OimWeb\\OimProject\\WebContent\\img\\meetImg"; // ��θ�
			int size = 1024 * 1024 * 100; // 100MB���� �������� ����
			String enctype = "UTF-8";
			// ���� ���ε��ϴ� ���̺귯�� (defaultfilerenamepolicy�� �Ⱥٿ��������� �ٿ��ִ°� ����)
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy() : ���ϸ��� �����Ҷ� ���ϸ��� �ڵ����� ����
			// Ex) a.jpg => a1.jpg => a2.jpg

			// ������ ���� �޾ƿ� �� mr�� ���ؼ� �޾ƿ´�.
	    	String meet_cg=mr.getParameter("meet_cg"); //ī�װ�
	     	String om_id=(String)session.getAttribute("id"); //id (�α������� ���ǿ��� �޾ƿ���)
	    	String meet_subject=mr.getParameter("meet_subject"); //����
	    	String meet_date=mr.getParameter("meet_date"); //���ӳ�¥
	    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1); //�߶� ���۳�¥ ������
	    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2); //�߶� ���ᳯ¥ ������
	    	String meet_loc1=mr.getParameter("meet_loc1"); //�ּ�
	    	String meet_loc2=mr.getParameter("meet_loc2"); ///���ּ�
	    	String meet_charge=mr.getParameter("meet_charge"); //��/���� ����
	    	String meet_total=mr.getParameter("meet_total"); //����
	    	String meet_limit=mr.getParameter("meet_total");//��û�����ο� => ó�� ���鶧 ��û�����ο��� ������ ����
	    	String meet_price=mr.getParameter("meet_price"); //�������
	    	String meet_lat=mr.getParameter("meet_lat");//����
	    	String meet_lng=mr.getParameter("meet_lng");//�浵
	    	String meet_info=mr.getParameter("meet_info"); //���ӳ���
	    	String meet_detail=mr.getParameter("meet_detail"); //������
	    	
	    	MeetingVO vo=new MeetingVO();
	    	vo.setMeet_cg(meet_cg);
	    	vo.setOm_id(om_id);
	    	vo.setMeet_subject(meet_subject);
	    	vo.setMeet_start(meet_start);
	    	vo.setMeet_end(meet_end);
	    	if(meet_loc1.equals("") && meet_loc2.equals("")) { //�Էµ� ������Ұ� ������
	    		vo.setMeet_loc("�����̰ų� ��ϵ� ������Ұ� �����ϴ�");
	    	}else if(!(meet_loc1.equals("")) && !(meet_loc2.equals(""))){//�ּ� , ���ּ� �Ѵ� �ԷµǾ�������
	    		vo.setMeet_loc(meet_loc1+" "+meet_loc2);
	    	}else { //�ϳ��� �ԷµǾ�������
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
	    	
	    	
			// upload => insert.jsp�� inputŸ���� �̸�
	    	int meet_no=MeetingDAO.getMeetingNumber();
	    	vo.setMeet_no(meet_no);
	    	String realname=Integer.toString(meet_no);
			String filename = mr.getFilesystemName("upload");
			
//			System.out.println("���ӹ�ȣ: "+meet_no);
//			System.out.println("���� ī�װ�: "+meet_cg);
//	    	System.out.println("������ID: "+om_id);
//	    	System.out.println("���� ����: "+meet_subject);
//	    	System.out.println("���۳�¥: "+meet_start);
//	    	System.out.println("���ᳯ¥: "+meet_end);
//	    	System.out.println("�ּ�: "+vo.getMeet_loc());
//	    	System.out.println("��/���Ῡ��: "+meet_charge);
//	    	System.out.println("��������: "+meet_total);
//	    	System.out.println("�������: "+meet_price);
//	    	System.out.println("����: "+meet_lat);
//	    	System.out.println("�浵: "+meet_lng);
//	    	System.out.println("���ӼҰ�: "+meet_info);
//	    	System.out.println("�󼼳���: "+meet_detail);

			// ��������
			if (filename != null) {
				File f = new File(path+"\\"+filename);
				File f2 = new File(path+"\\"+realname+f.getName().substring(f.getName().indexOf('.')));

				f.renameTo(f2);
		    	vo.setMeet_poster("img/meetImg/"+f2.getName());
		    	System.out.println("�̹������:"+vo.getMeet_poster());
			}
			
	    	MeetingDAO.meetingInsert(vo); //���Ӱ����ϱ�
	    	
    	}catch(Exception ex) {
    		System.out.println("meeting_insert_ok: "+ex.getMessage());
    		ex.printStackTrace();
    	}
    	
    	req.setAttribute("main_jsp","../meeting/meeting_insert_ok.jsp");
    	return "main/main.jsp";		
    }
    
    @RequestMapping("meeting_update.do")
    public String meeting_Update(HttpServletRequest req, HttpServletResponse res) { //���Ӽ���ȭ��
    	String meet_no=req.getParameter("meet_no");
    	MeetingVO vo=MeetingDAO.meetingUpdateData(Integer.parseInt(meet_no));
    	Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		
		req.setAttribute("today", today); //���ó�¥
    	req.setAttribute("vo",vo);
    	return "meeting/meeting_update.jsp";
    }
    
    @RequestMapping("meeting_update_ok.do") //���Ӽ����Ϸ�
    public String meeting_update_ok(HttpServletRequest req, HttpServletResponse res) {
    	
    	try {
    		req.setCharacterEncoding("UTF-8"); // �ѱ� ���ϸ��� ����Ͽ� setcharencoding�� �������ش�.
			String path = "c:\\git\\OimWeb\\OimProject\\WebContent\\img\\meetImg"; // ��θ�
			int size = 1024 * 1024 * 100; // 100MB���� �������� ����
			String enctype = "UTF-8";
			// ���� ���ε��ϴ� ���̺귯�� (defaultfilerenamepolicy�� �Ⱥٿ��������� �ٿ��ִ°� ����)
			MultipartRequest mr = new MultipartRequest(req, path, size, enctype, new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy() : ���ϸ��� �����Ҷ� ���ϸ��� �ڵ����� ����
			// Ex) a.jpg => a1.jpg => a2.jpg

			// ������ ���� �޾ƿ� �� mr�� ���ؼ� �޾ƿ´�.
			String meet_no=mr.getParameter("meet_no");
	    	String meet_cg=mr.getParameter("meet_cg"); //ī�װ�
	    	String meet_reposter=mr.getParameter("meet_poster");
	    	String meet_poster=meet_reposter.substring(meet_reposter.lastIndexOf("/")+1);
	    	String meet_subject=mr.getParameter("meet_subject"); //����
	    	String meet_date=mr.getParameter("meet_date"); //���ӳ�¥
	    	String meet_start=meet_date.substring(0, meet_date.indexOf("~")-1); //�߶� ���۳�¥ ������
	    	String meet_end=meet_date.substring(meet_date.indexOf("~")+2); //�߶� ���ᳯ¥ ������
	    	String meet_loc1=mr.getParameter("meet_loc1"); //�ּ�
	    	String meet_loc2=mr.getParameter("meet_loc2"); ///���ּ�
	    	String meet_charge=mr.getParameter("meet_charge"); //��/���� ����
	    	String meet_total=mr.getParameter("meet_total"); //����
	    	String meet_limit=mr.getParameter("meet_limit"); //���� ��û�����ο�
	    	String meet_price=mr.getParameter("meet_price"); //�������
	    	String meet_lat=mr.getParameter("meet_lat");//����
	    	String meet_lng=mr.getParameter("meet_lng");//�浵
	    	String meet_info=mr.getParameter("meet_info"); //���ӳ���
	    	String meet_detail=mr.getParameter("meet_detail"); //������
	    	
	    	MeetingVO vo=new MeetingVO();
	    	vo.setMeet_no(Integer.parseInt(meet_no));
	    	vo.setMeet_cg(meet_cg);
	    	vo.setMeet_subject(meet_subject);
	    	vo.setMeet_start(meet_start);
	    	vo.setMeet_end(meet_end);
	    	
	    	if(meet_loc1.equals("") && meet_loc2.equals("")) { //�Էµ� ������Ұ� ������
	    		vo.setMeet_loc("�����̰ų� ��ϵ� ������Ұ� �����ϴ�");
	    	}else if(!(meet_loc1.equals("")) && !(meet_loc2.equals(""))){//�ּ� , ���ּ� �Ѵ� �ԷµǾ�������
	    		vo.setMeet_loc(meet_loc1+" "+meet_loc2);
	    	}else {//�ϳ��� �ԷµǾ�������
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
	    	
			System.out.println("���ӹ�ȣ: "+meet_no);
			System.out.println("���� ī�װ�: "+meet_cg);
			System.out.println("���� �����̸�: "+meet_poster);
	    	System.out.println("���� ����: "+meet_subject);
	    	System.out.println("���۳�¥: "+meet_start);
	    	System.out.println("���ᳯ¥: "+meet_end);
	    	System.out.println("�ּ�: "+vo.getMeet_loc());
	    	System.out.println("��/���Ῡ��: "+meet_charge);
	    	System.out.println("��������: "+meet_total);
	    	System.out.println("���ӽ�û�����ο�: "+meet_limit);
	    	System.out.println("�������: "+meet_price);
	    	System.out.println("����: "+meet_lat);
	    	System.out.println("�浵: "+meet_lng);
	    	System.out.println("���ӼҰ�: "+meet_info);
	    	System.out.println("�󼼳���: "+meet_detail);
	    	
	    	if(meet_reposter!="") { //���ӻ����� ���������ÿ��� �����ִ������� ���� �� �����Ѵ�.
				File dfile = new File(path+"\\"+meet_poster); //����Ǿ��ִ� ������ �����Ѵ�.
				if( dfile.exists() ){
		             if(dfile.delete()){
		                 System.out.println("���ϻ��� ����");
		             }else{
		                 System.out.println("���ϻ��� ����");
		             }
		         }else{
		             System.out.println("������ �������� �ʽ��ϴ�.");
		         }
				
				String realname=meet_no; //������ ����� ���ο� ������ �����Ѵ�.
				String filename = mr.getFilesystemName("upload");
				if (filename != null) {
					File f = new File(path+"\\"+filename);
					File f2 = new File(path+"\\"+realname+f.getName().substring(f.getName().indexOf('.')));

					f.renameTo(f2);
			    	vo.setMeet_poster("img/meetImg/"+f2.getName());
			    	System.out.println("�̹������:"+vo.getMeet_poster());
				}
	    	}else {
	    		vo.setMeet_poster(meet_reposter);
		    	System.out.println("�̹������:"+vo.getMeet_poster());
	    	}

	    	MeetingDAO.meetingUpdate(vo);
    	}catch(Exception ex) {
    		System.out.println(ex.getMessage());
    		ex.printStackTrace();
    	}
    	return "Oim_meetpage.do";
    }
    
    @RequestMapping("meeting_search.do") //���Ӱ˻����
	public String meeting_search(HttpServletRequest req, HttpServletResponse res) throws Throwable{
			req.setCharacterEncoding("UTF-8");
			
			String searchText=req.getParameter("searchText"); //�˻��� �޾ƿ���
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
					List<Map> mlist=new ArrayList<Map>(); //������ü����, ��ü�������� ���ؿ��� ���� HashMap
					
					//jsp�� ����
					HttpSession session=req.getSession();
					if(first==true) //���ʷ� ������������ session�� �����Ѵ�.
					{
						map.put("searchText", searchText);
						session.setAttribute("searchText", searchText);
						list=MeetingDAO.meetingSearchData(map);
						
						mlist=MeetingDAO.meetingSearchTotalPage(searchText);
						total=(int)mlist.get(0).get("total");
						totalpage=(int)mlist.get(0).get("totalpage");
					}
					else //�������� �Űܰ� ��쿡�� map�� �޸𸮸� ���� �Ҵ��ؼ� session�� ����� �˻������ �ִ´�.
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
