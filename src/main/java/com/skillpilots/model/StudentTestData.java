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

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="student_test_data")
public class StudentTestData {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="test_data_id")
Long test_data_id;
Long student_id;
Long test_id;
@Column(length = 10000)
String answer_set;
int marks_scored;
String status;
int out_off;
Long against_ext_req;
Long company_id;
Date creation_date;
Date updation_date;
@JsonFormat(shape=JsonFormat.Shape.STRING,  timezone="IST")
Date expiration_date;
public Long getTest_data_id() {
	return test_data_id;
}
public void setTest_data_id(Long test_data_id) {
	this.test_data_id = test_data_id;
}
public Long getStudent_id() {
	return student_id;
}
public void setStudent_id(Long long1) {
	this.student_id = long1;
}
public Long getTest_id() {
	return test_id;
}
public void setTest_id(Long test_id) {
	this.test_id = test_id;
}
public String getAnswer_set() {
	return answer_set;
}
public void setAnswer_set(String answer_set) {
	this.answer_set = answer_set;
}
public int getMarks_scored() {
	return marks_scored;
}
public void setMarks_scored(int marks_scored) {
	this.marks_scored = marks_scored;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public int getOut_off() {
	return out_off;
}
public void setOut_off(int out_off) {
	this.out_off = out_off;
}
public Long getAgainst_ext_req() {
	return against_ext_req;
}
public void setAgainst_ext_req(Long against_ext_req) {
	this.against_ext_req = against_ext_req;
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
public Long getCompany_id() {
	return company_id;
}
public void setCompany_id(Long long1) {
	this.company_id = long1;
}

}
