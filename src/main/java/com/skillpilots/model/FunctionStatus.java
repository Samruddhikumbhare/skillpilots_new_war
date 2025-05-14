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
@Table(name="func_status")
public class FunctionStatus {
@Id
@Column(name="func_name")
String func_name;
Date creation_date;
Date updation_date;
Date expiration_date;
String func_value;
public String getFunc_name() {
	return func_name;
}
public void setFunc_name(String func_name) {
	this.func_name = func_name;
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
public String getFunc_value() {
	return func_value;
}
public void setFunc_value(String func_value) {
	this.func_value = func_value;
}

}
