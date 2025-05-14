package com.skillpilots.model;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@Table(name="topup_data")
public class TopupData {
   
	@Id
	@Column(name="topup_data_id")
	private String topup_data_id;
	private String user_id;
	private int package_id;
	private String payment_mode;
	private String transaction_id;
	private String balance_data_id;
	private int no_of_internships;
	private Date creation_date;
	private Date effective_date;
	private Date payment_date;

	public String getTopup_data_id() {
		return topup_data_id;
	}

	public void setTopup_data_id(String topup_data_id) {
		this.topup_data_id = topup_data_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPackage_id() {
		return package_id;
	}

	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}

	public String getPayment_mode() {
		return payment_mode;
	}

	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public String getBalance_data_id() {
		return balance_data_id;
	}

	public void setBalance_data_id(String balance_data_id) {
		this.balance_data_id = balance_data_id;
	}

	public int getNo_of_internships() {
		return no_of_internships;
	}

	public void setNo_of_internships(int no_of_internships) {
		this.no_of_internships = no_of_internships;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public Date getEffective_date() {
		return effective_date;
	}

	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
}
