package com.skillpilots.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name="saved_internships")
public class SavedInternships {

	@Id
	@Column(name="s_id")
	private String s_id;
	private String stud_id;
	private String advertisement_id;
	private Date creation_date;
	private Date Expiration_date;
	public String getS_id() {
		return s_id;
	}
	public String getStud_id() {
		return stud_id;
	}
	public String getAdvertisement_id() {
		return advertisement_id;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public Date getExpiration_date() {
		return Expiration_date;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public void setAdvertisement_id(String advertisement_id) {
		this.advertisement_id = advertisement_id;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public void setExpiration_date(Date expiration_date) {
		Expiration_date = expiration_date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SavedInternships [s_id=");
		builder.append(s_id);
		builder.append(", stud_id=");
		builder.append(stud_id);
		builder.append(", advertisement_id=");
		builder.append(advertisement_id);
		builder.append(", creation_date=");
		builder.append(creation_date);
		builder.append(", Expiration_date=");
		builder.append(Expiration_date);
		builder.append("]");
		return builder.toString();
	}
	
	
}
