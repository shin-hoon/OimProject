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
	
	private String om_hid;
	private String om_htel;
	private String om_hemail;
	
	private String om_aid;
	private String om_atel;
	private String om_aemail;
	
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
	public String getOm_hid() {
		return om_hid;
	}
	public void setOm_hid(String om_hid) {
		this.om_hid = om_hid;
	}
	public String getOm_htel() {
		return om_htel;
	}
	public void setOm_htel(String om_htel) {
		this.om_htel = om_htel;
	}
	public String getOm_hemail() {
		return om_hemail;
	}
	public void setOm_hemail(String om_hemail) {
		this.om_hemail = om_hemail;
	}
	public String getOm_aid() {
		return om_aid;
	}
	public void setOm_aid(String om_aid) {
		this.om_aid = om_aid;
	}
	public String getOm_atel() {
		return om_atel;
	}
	public void setOm_atel(String om_atel) {
		this.om_atel = om_atel;
	}
	public String getOm_aemail() {
		return om_aemail;
	}
	public void setOm_aemail(String om_aemail) {
		this.om_aemail = om_aemail;
	}
	
}
