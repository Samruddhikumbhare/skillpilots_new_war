package com.skillpilots.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
@Entity
@Table(name = "notification_type")
public class NotificationType {

	@Id
	@Column(name = "notif_code")
	private String notif_code;
	private String category;
	private int no_of_params;
	private char manual_ind;
	private String notif_text;

	public String getNotif_code() {
		return notif_code;
	}
	public String getCategory() {
		return category;
	}
	public int getNo_of_params() {
		return no_of_params;
	}
	public char getManual_ind() {
		return manual_ind;
	}
	public String getNotif_text() {
		return notif_text;
	}
}
