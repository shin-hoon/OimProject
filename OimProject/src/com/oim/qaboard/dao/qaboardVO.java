package com.oim.qaboard.dao;

import java.util.*;
/*
 * qa_no NUMBER, --게시물번호
	om_id VARCHAR2(50) CONSTRAINT qaboard_om_id_nn NOT NULL, --회원ID
	qa_subject VARCHAR2(500) CONSTRAINT qaboard_qa_subject_nn NOT NULL, --제목
	qa_content CLOB CONSTRAINT qaboard_qa_content_nn NOT NULL, --내용
  	qa_pwd VARCHAR2(12) CONSTRAINT qaboard_qa_pwd_nn NOT NULL, --비밀번호
 	qa_regdate DATE DEFAULT SYSDATE, --등록일
 	qa_hit NUMBER DEFAULT 0, --조회수
 	qa_group_id NUMBER, --그룹ID
  	qa_group_step NUMBER DEFAULT 0, --그룹스텝
 	qa_group_tab NUMBER DEFAULT 0, --그룹탭
  	qa_root NUMBER DEFAULT 0, --부모글번호
 	qa_depth NUMBER DEFAULT 0
 */
public class qaboardVO {
	private int qa_no; 
	 private String om_id;
	 private String qa_subject;
	 private String qa_content;
	 private String qa_pwd;
	 private Date qa_regdate;
	 private int qa_hit;
	 private int qa_group_id;
	 private int qa_group_step;
	 private int qa_group_tab;
	 private int qa_root;
	 private int qa_depth;
	public int getQa_no() {
		return qa_no;
	}
	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public String getQa_subject() {
		return qa_subject;
	}
	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public String getQa_pwd() {
		return qa_pwd;
	}
	public void setQa_pwd(String qa_pwd) {
		this.qa_pwd = qa_pwd;
	}
	public Date getQa_regdate() {
		return qa_regdate;
	}
	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}
	public int getQa_hit() {
		return qa_hit;
	}
	public void setQa_hit(int qa_hit) {
		this.qa_hit = qa_hit;
	}
	public int getQa_group_id() {
		return qa_group_id;
	}
	public void setQa_group_id(int qa_group_id) {
		this.qa_group_id = qa_group_id;
	}
	public int getQa_group_step() {
		return qa_group_step;
	}
	public void setQa_group_step(int qa_group_step) {
		this.qa_group_step = qa_group_step;
	}
	public int getQa_group_tab() {
		return qa_group_tab;
	}
	public void setQa_group_tab(int qa_group_tab) {
		this.qa_group_tab = qa_group_tab;
	}
	public int getQa_root() {
		return qa_root;
	}
	public void setQa_root(int qa_root) {
		this.qa_root = qa_root;
	}
	public int getQa_depth() {
		return qa_depth;
	}
	public void setQa_depth(int qa_depth) {
		this.qa_depth = qa_depth;
	}
	 
	 
	  
	
	  
	  
}
