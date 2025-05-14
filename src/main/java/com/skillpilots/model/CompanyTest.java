package com.skillpilots.model;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name="company_test")
public class CompanyTest {

	@Id
	@Column(name="test_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long test_id;
	Long company_id;
	String test_name;
	String test_type;
	int test_time;
	int total_marks;
	int cut_off;
	int total_ques;
	int mark_per_ques;
	Date creation_date;
	Date updation_date;
	Date expiration_date;
	String status;
	Long institute_id;
	

	
	
	
}
