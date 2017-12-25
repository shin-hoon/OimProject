package com.oim.application.dao;

import java.sql.Date;

public class ApplicationVO {
	
	// 결제정보 : 신청번호, 신청날짜, 
	// 모임정보 : 포스터, 모임번호, 모임이름, 모임가격, 총인원, 신청가능인원, 개설자아이디, 개설자 전화번호, 개설자 이메일
	// 신청인원정보 : 아이디, 전화번호, 이메일
	private int ac_no;
	private Date ac_regdate;
	
	private String meet_poster;
	private int meet_no;
	private String meet_subject;
	private int meet_price;
	private int meet_total;
	private int meet_limit;
	
	private String om_id;
	private String om_tel;
	private String om_company;
	
	public int getAc_no() {
		return ac_no;
	}
	public void setAc_no(int ac_no) {
		this.ac_no = ac_no;
	}
	public Date getAc_regdate() {
		return ac_regdate;
	}
	public void setAc_regdate(Date ac_regdate) {
		this.ac_regdate = ac_regdate;
	}
	public String getMeet_poster() {
		return meet_poster;
	}
	public void setMeet_poster(String meet_poster) {
		this.meet_poster = meet_poster;
	}
	public int getMeet_no() {
		return meet_no;
	}
	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}
	public String getMeet_subject() {
		return meet_subject;
	}
	public void setMeet_subject(String meet_subject) {
		this.meet_subject = meet_subject;
	}
	public int getMeet_price() {
		return meet_price;
	}
	public void setMeet_price(int meet_price) {
		this.meet_price = meet_price;
	}
	public int getMeet_total() {
		return meet_total;
	}
	public void setMeet_total(int meet_total) {
		this.meet_total = meet_total;
	}
	public int getMeet_limit() {
		return meet_limit;
	}
	public void setMeet_limit(int meet_limit) {
		this.meet_limit = meet_limit;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public String getOm_tel() {
		return om_tel;
	}
	public void setOm_tel(String om_tel) {
		this.om_tel = om_tel;
	}
	public String getOm_company() {
		return om_company;
	}
	public void setOm_company(String om_company) {
		this.om_company = om_company;
	}
	
	
	
	
}
