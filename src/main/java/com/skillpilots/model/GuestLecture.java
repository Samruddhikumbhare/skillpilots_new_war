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
@Table(name="guest_lect")
public class GuestLecture {

	@Id
	@Column(name="id")
	private String id;
	private String technology;
	private String time;
	private String topic;
	private String guest_name;
	private String venue;
	private Date creation_date;
	private Date updation_date;
	private Date expiration_date;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
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
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GuestLecture [id=");
		builder.append(id);
		builder.append(", technology=");
		builder.append(technology);
		builder.append(", time=");
		builder.append(time);
		builder.append(", topic=");
		builder.append(topic);
		builder.append(", guest_name=");
		builder.append(guest_name);
		builder.append(", venue=");
		builder.append(venue);
		builder.append(", creation_date=");
		builder.append(creation_date);
		builder.append(", updation_date=");
		builder.append(updation_date);
		builder.append(", expiration_date=");
		builder.append(expiration_date);
		builder.append("]");
		return builder.toString();
	}
}
