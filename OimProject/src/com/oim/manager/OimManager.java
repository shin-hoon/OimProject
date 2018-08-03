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
	      
	      list = oim.meetingTop100(); //���ӵ����� �Ľ��ؼ�  list�� �߰��ϱ�
	      
	      System.out.println("���� ����!");
	      for(MeetingVO vo:list) { //�Ľ��� ������ DB�� insert�ϱ�
	    	  
	    	  MeetingDAO.DbInsert(vo);
	    	  System.out.println(vo.getMeet_no()+": ���� ����!");
	    	  
	      }
	      System.out.println("���� �Ϸ�!");
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
 		                 Element charge=doc.selectFirst("span.eventFree"); //����,���� ����
 		                 Element category=doc.selectFirst("span.eventCategory"); //ī�װ�
 		                 
 		                 //left
 		                 Element poster=doc.selectFirst("div.left div.eventThumbnail a img"); //������
 		                 Element hostname=doc.selectFirst("div.host ul.hostInfo li.hostName");
 		                 Element hostemail=doc.selectFirst("div.host ul.hostInfo li.hostEmail");
 		                 Element hosttel=doc.selectFirst("div.host ul.hostInfo li.hostPhone");
 		                 Element hostcompany=doc.selectFirst("div.host ul.hostInfo li.hostCompany"); 
 		                 Elements hostnameall=doc.select("div.host ul.hostInfo li.hostName span.strGarbage");//�̸��� �پ��ִ� ������ ��
 		                 
 		                 String name=hostname.text();
 		                       
 		                 for(int j=0; j<hostnameall.size(); j++) {
 		                    name= name.replace(hostnameall.get(j).text(),""); //�����Ⱚ�� �������� ��ü
 		                 }
 		                
 		                 //right
 		                 Element title=doc.selectFirst("div.right h2.eventTitle"); //����
 		                 Element date=doc.selectFirst("div.right dd.date"); // ��¥
 		                 Element place=doc.selectFirst("div.right dd.place span"); //���
 		                 Element total=doc.selectFirst("div.right dd.attend span.total span.number"); //���ο�
 		                 Element limit=doc.selectFirst("div.right dd.attend span.free span.number"); //�����ο�
 		                 Element info=doc.selectFirst("div.right div.summary p"); //����
 		                 
 		                 //gruopBox
 		                 Element priceE=doc.selectFirst("div.groupBox div.group p.pay"); //����
 		                 Element outside=doc.selectFirst("div.groupBox div.group p.groupTitle span.blue"); //�ܺΰ���
 		                 
 		                 //���ư
 		                 Element jj=doc.selectFirst("div.btnArea span.count");
 		                 
 		                 //�󼼳���
 		                 Element detail = doc.selectFirst("div.description");
 		                 Elements map = doc.select("div#mapzone");
 		                 
 		                 // ���� / �浵
 		                 String lat = map.attr("data-lat");
 		                 String lng = map.attr("data-lng");
 		                 
 		                 // �� ���� 
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
 		               
 		                 if(jjim.equals("��")){
 		                    jjim="0";
 		                 }

 		                 
 		                 try {
 		                     tpeople = total.text();
 		                  }catch (Exception e) {
 		                    tpeople = "��������";
 		                  }
 		                  
 		                 try {
 		                    lpeople = limit.text();
 		                 }catch (Exception e) {
 		                    lpeople = "��������";
 		                 }
 		                 
 		                 try {
 		                    company = hostcompany.text();
 		                 }catch (Exception e) {
 		                    company = "��������";
 		                 }
 		                 
 		                 try {
 		                   p = outside.text();
 		                   
 		                 }catch (Exception e) {
 		                   p = priceE.text();
 		                 }
 		                
 		                 if(p.substring(0, 2).equals("�ܺ�")) {
 		                	 System.out.println(i+" �� �ܺθ����Դϴ�.");
 		                    continue;
 		                 }
 		                
 		                 
 		                 
 		                //System.out.println(a); 
 		                
 		                 
 		               
 		                 int price = 0;
 		               
 		                 if(p.substring(0,2).equals("����")) {
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
 		                	 
 		                	 if(datestr.charAt(k)=='��') {
 		                		 yearcount++;
 		                	 }
 		                	 if(datestr.charAt(k)=='��') {
 		                		 monthcount++;
 		                	 }
 		                 }
 		                
// 		                 System.out.println("���ӹ�ȣ : "+i);
// 		                 System.out.println("����/���� : "+charge.text()); 
// 		                 System.out.println("ī�װ� : "+category.text());
// 		                 System.out.println("���ӻ��� : "+poster.attr("src"));
// 		                 System.out.println("������ �̸� : "+name);                 
// 		                 System.out.println("������ �̸��� : "+hostemail.text());
// 		                 System.out.println("������ ��ȭ��ȣ : "+hosttel.text());
// 		                 System.out.println("������ �Ҽ� : "+company);
// 		                 System.out.println("�������� : "+title.text());
// 		                 System.out.println("���೯¥ : "+datestr); // ���� ��¥ //���ᳯ¥ ����
 		                 
 		                 	if(monthcount==1) { //�Ϸ�¥�� �����϶�
 		                 		 
 		                	 if(yearcount==0) { //�⵵ ǥ�ð� ������ (2018��)
 		                		 startyear="2018";
 		                		 endyear="2018";
 		                	 }else if(yearcount==1) { //�⵵ ǥ�ð� 1��������(2017��)
 		                		 startyear="2017";
 		                		 endyear="2017";
 		                	 }
 		                	 if(startyear.equals("2018")){
 		                		 datestr=" "+datestr;
	 		                	 startmonth=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		                	 endmonth=startmonth; //���ۿ��� ������� ����
 		                	 }else {
 		                		 startmonth=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		                	 endmonth=startmonth; //���ۿ��� ������� ����
 		                	 }
 		                	 
 		                	 startday=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 startday=startday.replace(" ", "0");
 		                	 endday=startday; //�����ϰ� �������� ����
 		                	 
 		                	 starthour=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 starthour=starthour.replace(" ", "0");
 		                	 
 		                	 endhour=datestr.substring(datestr.lastIndexOf('��')-2, datestr.lastIndexOf('��'));
 		                	 endhour=endhour.replace(" ", "0");
 		                	 
 		                	 startminute=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 endminute=datestr.substring(datestr.lastIndexOf('��')-2, datestr.lastIndexOf('��'));
 		                	 
 		                	 startdate=startyear+"-"+startmonth+"-"+startday+" "+starthour+":"+startminute;
 		                	 enddate=endyear+"-"+endmonth+"-"+endday+" "+endhour+":"+endminute;
 		                
// 		                  	 startFormat2=java.sql.Date.valueOf(startyear+"-"+startmonth+"-"+startday);
// 		                  	 endFormat2=java.sql.Date.valueOf(endyear+"-"+endmonth+"-"+endday);
// 		                  	 startFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
//		                  	 endFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
 		                  	 
// 		                	 System.out.println("���۳�¥:"+startdate);
// 		                	 System.out.println("���ᳯ¥:"+enddate);
// 		                	 System.out.println("���۳�¥ (date��ȯ):"+sdf.format(startFormat).toString());
// 		                	 System.out.println("���ᳯ¥ (date��ȯ):"+sdf.format(endFormat).toString());
 			                
 		                 }else { //�Ϸ��̻� �����϶�     
 		                	 
 		                	 if(yearcount==0) { //�⵵ ǥ�ð� ������ (2017��)
 		                		 startyear="2018";
 		                		 endyear="2018";
 		                	 }else if(yearcount==1) { //�⵵ ǥ�ð� 1��������(2017�� ����, 2018�� ����)
 		                		 startyear="2017";
 		                		 endyear="2018";
 		                	 }else { //�⵵ ǥ�ð� 2�� �̻� ������(2017��)
 		                		 startyear="2017";
 		                		 endyear="2017";
 		                	 }
 		                	 
 		                	
 		                	if(startyear.equals("2018")){
		                		 datestr=" "+datestr;
	 		                	 startmonth=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
	 		                	 startmonth=startmonth.replace(" ", "0");
	 		       
		                	 }else {
		                		 startmonth=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
	 		                	 startmonth=startmonth.replace(" ", "0");
		                	 }
 		                	 
 		                	 endmonth=datestr.substring(datestr.lastIndexOf('��')-2, datestr.lastIndexOf('��'));
 		                	 endmonth=endmonth.replace(" ", "0");
 		                	 
 		                	 startday=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 startday=startday.replace(" ", "0");
 		                	 
 		                	 endday=datestr.substring(datestr.indexOf('��',datestr.indexOf('~'))-2, datestr.indexOf('��',datestr.indexOf('~')));
 		                	 endday=endday.replace(" ", "0");
 		                	 
 		                	 starthour=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 starthour=starthour.replace(" ", "0");
 		                	 
 		                	 endhour=datestr.substring(datestr.lastIndexOf('��')-2, datestr.lastIndexOf('��'));
 		                	 endhour=endhour.replace(" ", "0");
 		                	 
 		                	 startminute=datestr.substring(datestr.indexOf('��')-2, datestr.indexOf('��'));
 		                	 endminute=datestr.substring(datestr.lastIndexOf('��')-2, datestr.lastIndexOf('��'));
 		                	 
 		                	 startdate=startyear+"-"+startmonth+"-"+startday+" "+starthour+":"+startminute;
 		                	 enddate=endyear+"-"+endmonth+"-"+endday+" "+endhour+":"+endminute;
 		                	 
// 		                	 startFormat = sdf.parse(startdate);
// 		                	 endFormat = sdf.parse(enddate);
 		                	
// 		                  	 startFormat2=java.sql.Date.valueOf(startyear+"-"+startmonth+"-"+startday);
// 		                  	 endFormat2=java.sql.Date.valueOf(endyear+"-"+endmonth+"-"+endday);
// 		                  	 startFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
//		                  	 endFormat2=java.sql.Timestamp.valueOf("2006-11-11 12:13:24");
 		                	
// 		                	 System.out.println("���۳�¥ (date��ȯ):"+sdf.format(startFormat).toString());
// 		                	 System.out.println("���ᳯ¥ (date��ȯ):"+sdf.format(endFormat).toString());
 		                 }
 		               	 
// 		                 System.out.println("������� : "+place.text());
// 		                 System.out.println("���ο� : "+tpeople);
// 		                 System.out.println("�����ο� : "+lpeople);
// 		                 System.out.println("���ӳ��� : "+info.text());
// 		                 System.out.println("��� : "+price+" ��");
// 		                 System.out.println("�� : "+jjim);
// 		                 System.out.println("������ : "+detail.html());
// 		                 System.out.println("����/�浵 : "+lat+" / "+lng);
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
 		                 
 		    			System.out.println("���ӹ�ȣ: "+i);
 		    			System.out.println("");
 		    			
 		               }catch(Exception ex) {
 		            	   
 		               }
 		           }
 		         System.out.println("������������ ��:"+count+"�� \n");
 		         
 		      }catch (Exception e) {
 		         e.printStackTrace();
 		      }
 			 
 			return list;
 		}

}