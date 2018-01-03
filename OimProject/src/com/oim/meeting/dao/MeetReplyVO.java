package com.oim.meeting.dao;

import java.util.*;

public class MeetReplyVO {
	private int meet_no;
	private int reply_no ;
	private String om_id;
	private String om_name ;
	private String reply_msg ;
	private Date reply_regdate;
	private int regroup_id;
	private int regroup_step;
	private int regroup_tab;
	private int root;
	private int depth;
	
	public int getMeet_no() {
		return meet_no;
	}
	public void setMeet_no(int meet_no) {
		this.meet_no = meet_no;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getOm_id() {
		return om_id;
	}
	public void setOm_id(String om_id) {
		this.om_id = om_id;
	}
	public String getOm_name() {
		return om_name;
	}
	public void setOm_name(String om_name) {
		this.om_name = om_name;
	}
	public String getReply_msg() {
		return reply_msg;
	}
	public void setReply_msg(String reply_msg) {
		this.reply_msg = reply_msg;
	}
	public Date getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public int getRegroup_id() {
		return regroup_id;
	}
	public void setRegroup_id(int regroup_id) {
		this.regroup_id = regroup_id;
	}
	public int getRegroup_step() {
		return regroup_step;
	}
	public void setRegroup_step(int regroup_step) {
		this.regroup_step = regroup_step;
	}
	public int getRegroup_tab() {
		return regroup_tab;
	}
	public void setRegroup_tab(int regroup_tab) {
		this.regroup_tab = regroup_tab;
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
	
}
