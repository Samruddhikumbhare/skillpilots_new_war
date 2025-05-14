package com.skillpilots.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyDrive {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long driveId;
	private String companyName;
	private String skill;
	private String jobRole;
	private String ctc;
	private String interviewDate;
	private String jobDescription;
	private String location;

	private String creationDate;
	private String status = "A";
	private String ssc;
	private String hsc;
	private String ug;
	private String experience;
	private String deptName;
	private Long companyId;

	private String jobType;

	private String workingType;

	private String question1;
	private String question2;
	private String question3;
	@PrePersist
	public void date() {
		
		DateTimeFormatter dateTimeFormatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.creationDate=LocalDate.now().format(dateTimeFormatter);
	}
	
	
	

}
