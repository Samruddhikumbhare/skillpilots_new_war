package com.skillpilots.model;

import java.util.Date;

public class NotificationsDetails {
	private String notification_id;
	private String user_id;
	private String dept_link_id;
	private String from_user;
	private String notif_code;
	private String notif_msg;
	private char status;
	private Date creation_date;
	private Date read_date;
	private String creation_time;
	private Date past_date;
	private int hour;
	public String getNotification_id() {
		return notification_id;
	}
	public void setNotification_id(String notification_id) {
		this.notification_id = notification_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDept_link_id() {
		return dept_link_id;
	}
	public void setDept_link_id(String dept_link_id) {
		this.dept_link_id = dept_link_id;
	}
	public String getFrom_user() {
		return from_user;
	}
	public void setFrom_user(String from_user) {
		this.from_user = from_user;
	}
	public String getNotif_code() {
		return notif_code;
	}
	public void setNotif_code(String notif_code) {
		this.notif_code = notif_code;
	}
	public String getNotif_msg() {
		return notif_msg;
	}
	public void setNotif_msg(String notif_msg) {
		this.notif_msg = notif_msg;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public Date getRead_date() {
		return read_date;
	}
	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}
	public String getCreation_time() {
		return creation_time;
	}
	public void setCreation_time(String creation_time) {
		this.creation_time = creation_time;
	}
	public Date getPast_date() {
		return past_date;
	}
	public void setPast_date(Date past_date) {
		this.past_date = past_date;
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getSec() {
		return sec;
	}
	public void setSec(int sec) {
		this.sec = sec;
	}
	public String getYesterday() {
		return yesterday;
	}
	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}
	private int min;
	private int sec;
	private String yesterday;
}
