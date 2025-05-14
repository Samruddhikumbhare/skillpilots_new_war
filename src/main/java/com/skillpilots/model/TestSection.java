package com.skillpilots.model;


import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="test_section")
public class TestSection {

	@Id
	@Column(name="section_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long section_id;
	
	@JsonProperty("testId")
	Long test_id;
	@JsonProperty("secName")
	String section_name;
	@JsonProperty("secTime")
	int section_time;
	@JsonProperty("secTotalQues")
	int total_ques;
	@JsonProperty("secCutoff")
	int cut_off;
	@JsonProperty("secMarkQues")
	int mark_per_ques;

	
	
}
