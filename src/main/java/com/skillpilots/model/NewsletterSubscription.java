package com.skillpilots.model;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "newsletter_subscription")
public class NewsletterSubscription {
	@Id
	@Column(name="email_id")
	private String email_id;
	private String username;
	private char status;
	private Date creation_date;
	private Date updation_date;
	private String linked_user_id;
	private long contact_no;
	
	public long getContact_no() {
		return contact_no;
	}
	public void setContact_no(long contact_no) {
		this.contact_no = contact_no;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public Date getUpdation_date() {
		return updation_date;
	}
	public void setUpdation_date(Date updation_date) {
		this.updation_date = updation_date;
	}
	public String getUser_id() {
		return linked_user_id;
	}
	public void setUser_id(String user_id) {
		this.linked_user_id = user_id;
	}
}
