package com.oim.member.dao;

import java.util.*;
public class MemberVO {
   
   /*om_id VARCHAR2(50), --ID
      om_pwd VARCHAR2(24) CONSTRAINT mem_om_pwd_nn NOT NULL, --비밀번호
      om_name VARCHAR2(10) CONSTRAINT mem_om_name_nn NOT NULL, --이름
      om_birth VARCHAR2(20) CONSTRAINT mem_om_birth_nn NOT NULL, --생년월일
      om_gender CHAR(4), --성별
      om_tel VARCHAR2(13), --전화번호
       om_company VARCHAR2(30), --소속명
      om_regdate DATE DEFAULT SYSDATE, --가입일
      CONSTRAINT mem_om_id_pk PRIMARY KEY(om_id),
      CONSTRAINT mem_om_gender_ck CHECK(om_gender IN('남자','여자')),
      CONSTRAINT mem_om_tel_uk UNIQUE(om_tel)   */
   
   private String om_id;
   private String om_pwd;
   private String om_name;
   private String om_birth;
   private String om_gender;
   private String om_tel;
   private String tel1;
   private String tel2;
   private String tel3;
   private String om_company;
   private Date om_regdate;
   private int count;    //아이디 비번 체크할 숫자
   
public String getOm_id() {
	return om_id;
}
public void setOm_id(String om_id) {
	this.om_id = om_id;
}
public String getOm_pwd() {
	return om_pwd;
}
public void setOm_pwd(String om_pwd) {
	this.om_pwd = om_pwd;
}
public String getOm_name() {
	return om_name;
}
public void setOm_name(String om_name) {
	this.om_name = om_name;
}
public String getOm_birth() {
	return om_birth;
}
public void setOm_birth(String om_birth) {
	this.om_birth = om_birth;
}
public String getOm_gender() {
	return om_gender;
}
public void setOm_gender(String om_gender) {
	this.om_gender = om_gender;
}
public String getOm_tel() {
	
	if(tel2==null || tel3==null) {	//초기 DB에 저장되어있는 정보일 경우
		
		return om_tel;
	}
	else {							
		return tel1+"-"+tel2+"-"+tel3;
	}
	
}
public void setOm_tel(String om_tel) {
	this.om_tel = om_tel;
}

public void setTel1(String tel1) {
	this.tel1 = tel1;
}

public void setTel2(String tel2) {
	this.tel2 = tel2;
}

public void setTel3(String tel3) {
	this.tel3 = tel3;
}
public String getOm_company() {
	return om_company;
}
public void setOm_company(String om_company) {
	this.om_company = om_company;
}

public Date getOm_regdate() {
	return om_regdate;
}
public void setOm_regdate(Date om_regdate) {
	this.om_regdate = om_regdate;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
   

}