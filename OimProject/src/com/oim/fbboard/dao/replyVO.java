package com.oim.fbboard.dao;

import java.util.Date;

public class replyVO {
	  private int no;
	  private int bno;
	  private String om_id;
	  private String msg;
	  private String name;
	  private Date regdate;
	  private int group_id;
	  private int group_step;
	  private int group_tab;
	  private int root;
	  private int depth;
	  private String dbday;
	  private String dbday2;
	  
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	} 
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getDbday2() {
		return dbday2;
	}
	public void setDbday2(String dbday2) {
		this.dbday2 = dbday2;
	}
	  
	  
}
