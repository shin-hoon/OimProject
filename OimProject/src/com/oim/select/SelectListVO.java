package com.oim.select;
import java.util.*;

public class SelectListVO {
    private int meet_no; // 모임번호
    private String meet_charge; // 유료,무료구분 
    private String meet_cg; // 카테고리
    private String meet_poster; // 포스터URL
    private String om_id;  // 개설자ID
    private String meet_subject; // 모임제목
    private String meet_start;  // 시작날짜
    private String meet_end;  // 종료날짜
    private String meet_loc;  // 모임장소
    private int meet_total;  // 정원
    private int meet_limit;  // 신청가능인원
    private String meet_info;  // 모임소개내용
    private int meet_price;  // 참여비용
    private int meet_like;  // 찜
    private String meet_detail;  // 상세정보
    private String meet_lat;  // 위도
    private String meet_lng;  // 경도
    private Date meet_regdate;  // 등록날짜
    private int meet_hit;  // 조회수
    private int rownum;  // 총 칼럼수
    
    
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getMeet_no() {
		return meet_no;
	}
	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}
	public String getMeet_charge() {
		return meet_charge;
	}
	public void setMeet_charge(String meet_charge) {
		this.meet_charge = meet_charge;
	}
	public String getMeet_cg() {
		return meet_cg;
	}
	public void setMeet_cg(String meet_cg) {
		this.meet_cg = meet_cg;
	}
	public String getMeet_poster() {
		return meet_poster;
	}
	public void setMeet_poster(String meet_poster) {
		this.meet_poster = meet_poster;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public String getMeet_subject() {
		return meet_subject;
	}
	public void setMeet_subject(String meet_subject) {
		this.meet_subject = meet_subject;
	}
	public String getMeet_start() {
		return meet_start;
	}
	public void setMeet_start(String meet_start) {
		this.meet_start = meet_start;
	}
	public String getMeet_end() {
		return meet_end;
	}
	public void setMeet_end(String meet_end) {
		this.meet_end = meet_end;
	}
	public String getMeet_loc() {
		return meet_loc;
	}
	public void setMeet_loc(String meet_loc) {
		this.meet_loc = meet_loc;
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
	public String getMeet_info() {
		return meet_info;
	}
	public void setMeet_info(String meet_info) {
		this.meet_info = meet_info;
	}
	public int getMeet_price() {
		return meet_price;
	}
	public void setMeet_price(int meet_price) {
		this.meet_price = meet_price;
	}
	public int getMeet_like() {
		return meet_like;
	}
	public void setMeet_like(int meet_like) {
		this.meet_like = meet_like;
	}
	public String getMeet_detail() {
		return meet_detail;
	}
	public void setMeet_detail(String meet_detail) {
		this.meet_detail = meet_detail;
	}
	public String getMeet_lat() {
		return meet_lat;
	}
	public void setMeet_lat(String meet_lat) {
		this.meet_lat = meet_lat;
	}
	public String getMeet_lng() {
		return meet_lng;
	}
	public void setMeet_lng(String meet_lng) {
		this.meet_lng = meet_lng;
	}
	public Date getMeet_regdate() {
		return meet_regdate;
	}
	public void setMeet_regdate(Date meet_regdate) {
		this.meet_regdate = meet_regdate;
	}
	public int getMeet_hit() {
		return meet_hit;
	}
	public void setMeet_hit(int meet_hit) {
		this.meet_hit = meet_hit;
	}
    
	   
}
