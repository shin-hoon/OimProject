package com.oim.manager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.*;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.oim.meeting.dao.MeetingDAO;
import com.oim.meeting.dao.MeetingVO;

public class OimManager {
	   public static void main(String[] args) {
	      
	      List<MeetingVO> list = new ArrayList<MeetingVO>();
	      OimManager oim = new OimManager();
	      
	      list = oim.meetingTop100(); //모임데이터 파싱해서  list에 추가하기
	      
	      System.out.println("저장 시작!");
	      for(MeetingVO vo:list) { //파싱한 데이터 DB에 insert하기
	    	  
	    	  MeetingDAO.DbInsert(vo);
	    	  System.out.println(vo.getMeet_no()+": 저장 성공!");
	    	  
	      }
	      System.out.println("저장 완료!");
	   }
	   
		public List<MeetingVO> meetingTop100(){
 			
 			List<MeetingVO> list = new ArrayList<MeetingVO>();
				
 			 try {
 		         int count=0;
 		         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

// 		        for(int i=124294; i<=124300; i++) { 3325
// 		        for(int i=123405; i<=124293; i++) {
 		        for(int i=119680; i<=122000; i++) {
 		        	//for(int i=123258; i<=123500; i++) {
 		        	try {
 		                 Document doc=Jsoup.connect("https://onoffmix.com/event/"+String.valueOf(i)).get();
 		                 
 		                 //top
 		                 Element charge=doc.selectFirst("span.eventFree"); //유료,무료 구분
 		                 Element category=doc.selectFirst("span.eventCategory"); //카테고리
 		                 
 		                 //left
 		                 Element poster=doc.selectFirst("div.left div.eventThumbnail a img"); //포스터
 		                 Element hostname=doc.selectFirst("div.host ul.hostInfo li.hostName");
 		                 Element hostemail=doc.selectFirst("div.host ul.hostInfo li.hostEmail");
 		                 Element hosttel=doc.selectFirst("div.host ul.hostInfo li.hostPhone");
 		                 Element hostcompany=doc.selectFirst("div.host ul.hostInfo li.hostCompany"); 
 		                 Elements hostnameall=doc.select("div.host ul.hostInfo li.hostName span.strGarbage");//이름에 붙어있는 쓰레기 값
 		                 
 		                 String name=hostname.text();
 		                       
 		                 for(int j=0; j<hostnameall.size(); j++) {
 		                    name= name.replace(hostnameall.get(j).text(),""); //쓰레기값을 공백으로 대체
 		                 }
 		                
 		                 //right
 		                 Element title=doc.selectFirst("div.right h2.eventTitle"); //제목
 		                 Element date=doc.selectFirst("div.right dd.date"); // 날짜
 		                 Element place=doc.selectFirst("div.right dd.place span"); //장소
 		                 Element total=doc.selectFirst("div.right dd.attend span.total span.number"); //총인원
 		                 Element limit=doc.selectFirst("div.right dd.attend span.free span.number"); //가능인원
 		                 Element info=doc.selectFirst("div.right div.summary p"); //정보
 		                 
 		                 //gruopBox
 		                 Element priceE=doc.selectFirst("div.groupBox div.group p.pay"); //가격
 		                 Element outside=doc.selectFirst("div.groupBox div.group p.groupTitle span.blue"); //외부개설
 		                 
 		                 //찜버튼
 		                 Element jj=doc.selectFirst("div.btnArea span.count");
 		                 
 		                 //상세내용
 		                 Element detail = doc.selectFirst("div.description");
 		                 Elements map = doc.select("div#mapzone");
 		                 
 		                 // 위도 / 경도
 		                 String lat = map.attr("data-lat");
 		                 String lng = map.attr("data-lng");
 		                 
 		                 // 찜 조건 
 		                 String jjim = jj.text();

 		                 String p = "";
 		                 String company= "";
 		                 String tpeople = "";
 		                 String lpeople = "";
 		                 
 		                 String startyear="";
 		                 String endyear="";
 		                 String startmonth="";
 		                 String endmonth="";
 		                 String startday="";
 		                 String endday="";
 		                 
 		                 String starthour="";
 		                 String endhour="";
 		                 String startminute="";
 		                 String endminute="";
 		                 String startdate="";
 		                 String enddate="";
 		               
 		                 if(jjim.equals("찜")){
 		                    jjim="0";
 		                 }

 		                 
 		                 try {
 		                     tpeople = total.text();
 		                  }catch (Exception e) {
 		                    tpeople = "정보없음";
 		                  }
 		                  
 		                 try {
 		                    lpeople = limit.text();
 		                 }catch (Exception e) {
 		                    lpeople = "정보없음";
 		                 }
 		                 
 		                 try {
 		                    company = hostcompany.text();
 		                 }catch (Exception e) {
 		                    company = "정보없음";
 		                 }
 		                 
 		                 try {
 		                   p = outside.text();
 		                   
 		                 }catch (Exception e) {
 		                   p = priceE.text();
 		                 }
 		                
 		                 if(p.substring(0, 2).equals("외부")) {
 		                	 System.out.println(i+" 는 외부모임입니다.");
 		                    continue;
 		                 }
 		                
 		                 
 		                 
 		                //System.out.println(a); 
 		                
 		                 
 		               
 		                 int price = 0;
 		               
 		                 if(p.substring(0,2).equals("무료")) {
 		                    price = 0;
 		                 }else {
 		                	String a = p.replaceAll("[^0-9]",""); //10001
 		                	String b = a.substring(0, a.length()-1); //1000
 		                    price = Integer.parseInt(b);
 		                 }
 		              
 		                 String datestr=date.text();
 		                 int yearcount=0;
 		                 int monthcount=0;
 		                 
 		                 for(int k=0; k<datestr.length();k++) {
 		                	 
 		                	 if(datestr.charAt(k)=='년') {
 		                		 yearcount++;
 		                	 }
 		                	 if(datestr.charAt(k)=='월') {
 		                		 monthcount++;
 		                	 }
 		                 }
 		                
// 		                 System.out.println("모임번호 : "+i);
// 		                 System.out.println("유료/무료 : "+charge.text()); 
// 		                 System.out.println("카테고리 : "+category.text());
// 		                 System.out.println("모임사진 : "+poster.attr("src"));
// 		                 System.out.println("개설자 이름 : "+name);                 
// 		                 System.out.println("개설자 이메일 : "+hostemail.text());
// 		                 System.out.println("개설자 전화번호 : "+hosttel.text());
// 		                 System.out.println("개설자 소속 : "+company);
// 		                 System.out.println("모임제목 : "+title.text());
// 		                 System.out.println("진행날짜 : "+datestr); // 시작 날짜 //종료날짜 구분
 		                 
 		                 	if(monthcount==1) { //하루짜리 모임일때
 		                 		 
 		                	 if(yearcount==0) { //년도 표시가 없을때 (2018년)
 		                		 startyear="2018";
 		                		 endyear="2018";
 		                	 }else if(yearcount==1) { //년도 표시가 1개있을때(2017년)
 		                		 startyear="2017";
 		                		 endyear="2017";
 		                	 }
 		                	 if(startyear.equals("2018")){
 		                		 datestr=" "+datestr;
	 		                	 startmonth=datestr.substring(datestr.indexOf('월')-2, datestr.indexOf('월'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		                	 endmonth=startmonth; //시작월과 종료월이 같음
 		                	 }else {
 		                		 startmonth=datestr.substring(datestr.indexOf('월')-2, datestr.indexOf('월'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		                	 endmonth=startmonth; //시작월과 종료월이 같음
 		                	 }
 		                	 
 		                	 startday=datestr.substring(datestr.indexOf('일')-2, datestr.indexOf('일'));
 		                	 startday=startday.replace(" ", "0");
 		                	 endday=startday; //시작일과 종료일이 같음
 		                	 
 		                	 starthour=datestr.substring(datestr.indexOf('시')-2, datestr.indexOf('시'));
 		                	 starthour=starthour.replace(" ", "0");
 		                	 
 		                	 endhour=datestr.substring(datestr.lastIndexOf('시')-2, datestr.lastIndexOf('시'));
 		                	 endhour=endhour.replace(" ", "0");
 		                	 
 		                	 startminute=datestr.substring(datestr.indexOf('분')-2, datestr.indexOf('분'));
 		                	 endminute=datestr.substring(datestr.lastIndexOf('분')-2, datestr.lastIndexOf('분'));
 		                	 
 		                	 startdate=startyear+"-"+startmonth+"-"+startday+" "+starthour+":"+startminute;
 		                	 enddate=endyear+"-"+endmonth+"-"+endday+" "+endhour+":"+endminute;
 		                
// 		                  	 startFormat2=java.sql.Date.valueOf(startyear+"-"+startmonth+"-"+startday);
// 		                  	 endFormat2=java.sql.Date.valueOf(endyear+"-"+endmonth+"-"+endday);
// 		                  	 startFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
//		                  	 endFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
 		                  	 
// 		                	 System.out.println("시작날짜:"+startdate);
// 		                	 System.out.println("종료날짜:"+enddate);
// 		                	 System.out.println("시작날짜 (date변환):"+sdf.format(startFormat).toString());
// 		                	 System.out.println("종료날짜 (date변환):"+sdf.format(endFormat).toString());
 			                
 		                 }else { //하루이상 모임일때     
 		                	 
 		                	 if(yearcount==0) { //년도 표시가 없을때 (2017년)
 		                		 startyear="2018";
 		                		 endyear="2018";
 		                	 }else if(yearcount==1) { //년도 표시가 1개있을때(2017년 시작, 2018년 종료)
 		                		 startyear="2017";
 		                		 endyear="2018";
 		                	 }else { //년도 표시가 2개 이상 있을때(2017년)
 		                		 startyear="2017";
 		                		 endyear="2017";
 		                	 }
 		                	 
 		                	
 		                	if(startyear.equals("2018")){
		                		 datestr=" "+datestr;
	 		                	 startmonth=datestr.substring(datestr.indexOf('월')-2, datestr.indexOf('월'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		       
		                	 }else {
		                		 startmonth=datestr.substring(datestr.indexOf('월')-2, datestr.indexOf('월'));
	 		                	 startmonth=startmonth.replace(" ", "0");
		                	 }
 		                	 
 		                	 endmonth=datestr.substring(datestr.lastIndexOf('월')-2, datestr.lastIndexOf('월'));
 		                	 endmonth=endmonth.replace(" ", "0");
 		                	 
 		                	 startday=datestr.substring(datestr.indexOf('일')-2, datestr.indexOf('일'));
 		                	 startday=startday.replace(" ", "0");
 		                	 
 		                	 endday=datestr.substring(datestr.indexOf('일',datestr.indexOf('~'))-2, datestr.indexOf('일',datestr.indexOf('~')));
 		                	 endday=endday.replace(" ", "0");
 		                	 
 		                	 starthour=datestr.substring(datestr.indexOf('시')-2, datestr.indexOf('시'));
 		                	 starthour=starthour.replace(" ", "0");
 		                	 
 		                	 endhour=datestr.substring(datestr.lastIndexOf('시')-2, datestr.lastIndexOf('시'));
 		                	 endhour=endhour.replace(" ", "0");
 		                	 
 		                	 startminute=datestr.substring(datestr.indexOf('분')-2, datestr.indexOf('분'));
 		                	 endminute=datestr.substring(datestr.lastIndexOf('분')-2, datestr.lastIndexOf('분'));
 		                	 
 		                	 startdate=startyear+"-"+startmonth+"-"+startday+" "+starthour+":"+startminute;
 		                	 enddate=endyear+"-"+endmonth+"-"+endday+" "+endhour+":"+endminute;
 		                	 
// 		                	 startFormat = sdf.parse(startdate);
// 		                	 endFormat = sdf.parse(enddate);
 		                	
// 		                  	 startFormat2=java.sql.Date.valueOf(startyear+"-"+startmonth+"-"+startday);
// 		                  	 endFormat2=java.sql.Date.valueOf(endyear+"-"+endmonth+"-"+endday);
// 		                  	 startFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
//		                  	 endFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
 		                	
// 		                	 System.out.println("시작날짜 (date변환):"+sdf.format(startFormat).toString());
// 		                	 System.out.println("종료날짜 (date변환):"+sdf.format(endFormat).toString());
 		                 }
 		               	 
// 		                 System.out.println("모임장소 : "+place.text());
// 		                 System.out.println("총인원 : "+tpeople);
// 		                 System.out.println("가능인원 : "+lpeople);
// 		                 System.out.println("모임내용 : "+info.text());
// 		                 System.out.println("비용 : "+price+" 원");
// 		                 System.out.println("찜 : "+jjim);
// 		                 System.out.println("상세정보 : "+detail.html());
// 		                 System.out.println("위도/경도 : "+lat+" / "+lng);
// 		                 System.out.println("============================================================================================================");

 		                
 		                MeetingVO vo = new MeetingVO();
 		     			vo.setMeet_no(i);
 		    			vo.setMeet_charge(charge.text());
 		    			vo.setMeet_cg(category.text());
 		    			vo.setMeet_poster(poster.attr("src"));
 		    			if(count<=200){
 		    				vo.setOm_id("lkk6201");
 		    			}else if(count<=400){
 		    				vo.setOm_id("jang");
 		    			}else if(count<=600){
 		    				vo.setOm_id("jeong");
 		    			}else if(count<=800){
 		    				vo.setOm_id("ko");
 		    			}else if(count<=1000) {
 		    				vo.setOm_id("park");
 		    			}else {
 		    				vo.setOm_id("yoo");
 		    			}
 		    			vo.setMeet_subject(title.text());
 		    			vo.setMeet_start(startdate);
 		    			vo.setMeet_end(enddate);
 		    			vo.setMeet_loc(place.text());
 		    			vo.setMeet_total(Integer.parseInt(tpeople));
 		    			vo.setMeet_limit(Integer.parseInt(lpeople));
 		    			vo.setMeet_info(info.text());
 		    			vo.setMeet_price(price);
 		    			vo.setMeet_like(Integer.parseInt(jjim));
 		    			vo.setMeet_detail(detail.html());
 		    			vo.setMeet_lat(lat);
 		    			vo.setMeet_lng(lng);
 		    			
 		    			list.add(vo);
 		    			count++;
 		                 
 		    			System.out.println("모임번호: "+i);
 		    			System.out.println("");
 		    			
 		               }catch(Exception ex) {
 		            	   
 		               }
 		           }
 		         System.out.println("내부접수모임 총:"+count+"개 \n");
 		         
 		      }catch (Exception e) {
 		         e.printStackTrace();
 		      }
 			 
 			return list;
 		}

}