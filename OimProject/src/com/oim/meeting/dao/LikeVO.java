package com.oim.meeting.dao;

public class LikeVO {

	private int basket_no;
	private String om_id;
	private int meet_no;
	private MeetingVO mvo=new MeetingVO();
	
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public int getMeet_no() {
		return meet_no;
	}
	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}
	public MeetingVO getMvo() {
		return mvo;
	}
	public void setMvo(MeetingVO mvo) {
		this.mvo = mvo;
	}
}
