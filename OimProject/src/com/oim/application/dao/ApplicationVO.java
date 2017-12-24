package com.oim.application.dao;

import java.sql.Date;

public class ApplicationVO {
	
	// 결제정보 : 신청번호, 신청날짜, 
	// 모임정보 : 포스터, 모임번호, 모임이름, 모임가격, 총인원, 신청가능인원, 개설자아이디, 개설자 전화번호,
	// 인원정보 : 아이디, 
	private int ac_no;
	private String om_id;
	private int meet_no;
	private int meet_price;
	
	private Date ac_regdate;
}
