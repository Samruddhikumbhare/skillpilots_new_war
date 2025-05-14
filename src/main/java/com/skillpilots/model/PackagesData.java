package com.skillpilots.model;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name = "packages_data")

public class PackagesData {
	@Id
	@Column(name = "package_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int package_id;

	public int getPackage_id() {
		return package_id;
	}

	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}

	public String getPackage_name() {
		return package_name;
	}

	public void setPackage_name(String package_name) {
		this.package_name = package_name;
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

	public Date getEffective_date() {
		return effective_date;
	}

	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}

	public Date getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getValidity() {
		return validity;
	}

	public void setValidity(int validity) {
		this.validity = validity;
	}

	public String getPackage_type() {
		return package_type;
	}

	public void setPackage_type(String package_type) {
		this.package_type = package_type;
	}

	public String getPackage_for() {
		return package_for;
	}

	public void setPackage_for(String package_for) {
		this.package_for = package_for;
	}

	private String package_name;
	private Date creation_date;
	private Date updation_date;
	private Date effective_date;
	private Date expiration_date;
	private double amount;
	private int validity;
	private int no_of_internships;
	private String package_type;
	private String package_for;
	private int no_of_dept;
	private String package_desc;

	public int getNo_of_internships() {
		return no_of_internships;
	}

	public void setNo_of_internships(int no_of_internships) {
		this.no_of_internships = no_of_internships;
	}

	public int getNo_of_dept() {
		return no_of_dept;
	}

	public void setNo_of_dept(int no_of_dept) {
		this.no_of_dept = no_of_dept;
	}

	public String getPackage_desc() {
		return package_desc;
	}

	public void setPackage_desc(String package_desc) {
		this.package_desc = package_desc;
	}
}
