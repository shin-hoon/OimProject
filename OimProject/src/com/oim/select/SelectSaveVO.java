package com.sist.SelectSave;

public class SelectSaveVO {
/*
String cst_no = request.getParameter("cst_no");
	String aa = (String)session.getAttribute("id");
	String subject = request.getParameter("cst_subject");
	String cst_cg[] = request.getParameterValues("cst_cg");
	String cst_loc[] = request.getParameterValues("cst_loc");
	String cst_day[] = request.getParameterValues("cst_day");
	String cst_price[] = request.getParameterValues("cst_price");	
*/	
	private int cst_no;  // 맞춤모임 번호1,2,3
	private String id; // 회원아이디
	private String subject; // 맞춤모임 제목
	private String cst_cg; // 
	private String cst_loc;
	private String cst_day;
	private String cst_price;
	
	
	public int getCst_no() {
		return cst_no;
	}
	public void setCst_no(int cst_no) {
		this.cst_no = cst_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getCst_cg() {
		return cst_cg;
	}
	public void setCst_cg(String cst_cg) {
		this.cst_cg = cst_cg;
	}
	public String getCst_loc() {
		return cst_loc;
	}
	public void setCst_loc(String cst_loc) {
		this.cst_loc = cst_loc;
	}
	public String getCst_day() {
		return cst_day;
	}
	public void setCst_day(String cst_day) {
		this.cst_day = cst_day;
	}
	public String getCst_price() {
		return cst_price;
	}
	public void setCst_price(String cst_price) {
		this.cst_price = cst_price;
	}
		
	
	
	
}
