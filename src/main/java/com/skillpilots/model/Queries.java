package com.skillpilots.model;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name = "queries")
public class Queries {
	@Id
	@Column(name="query_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	long query_id;
	String email_id;
	String username;
	String query;
	String reply;
	long related_query;
	Date query_date;
	Date reply_date;
	
	public Date getQuery_date() {
		return query_date;
	}
	public void setQuery_date(Date query_date) {
		this.query_date = query_date;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public long getQuery_id() {
		return query_id;
	}
	public void setQuery_id(long query_id) {
		this.query_id = query_id;
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
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public long getRelated_query() {
		return related_query;
	}
	public void setRelated_query(long related_query) {
		this.related_query = related_query;
	}
	
}
