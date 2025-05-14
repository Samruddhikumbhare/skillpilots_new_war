package com.skillpilots.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name="reason_code")
public class ReasonCodes {
@Id
@Column(name="reason_code")
String reason_code;
String reason_msg;
String reason_for;
int for_role;
String flow_code;
public String getReason_code() {
	return reason_code;
}
public void setReason_code(String reason_code) {
	this.reason_code = reason_code;
}
public String getReason_msg() {
	return reason_msg;
}
public void setReason_msg(String reason_msg) {
	this.reason_msg = reason_msg;
}
public String getReason_for() {
	return reason_for;
}
public void setReason_for(String reason_for) {
	this.reason_for = reason_for;
}
public int getFor_role() {
	return for_role;
}
public void setFor_role(int for_role) {
	this.for_role = for_role;
}
public String getFlow_code() {
	return flow_code;
}
public void setFlow_code(String flow_code) {
	this.flow_code = flow_code;
}
}
