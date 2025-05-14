package com.skillpilots.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import lombok.Data;

@Data
@Entity
public class SolvedAssignments {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long solvedId;
	private Long companyId;
	private String team_name;
	private Long studentId;
	private String uploadUrl;
	
	private String uploadAt;
	
	
	@PrePersist
	public void uploadAt() {
		
		DateTimeFormatter formatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
	this.uploadAt=	LocalDate.now().format(formatter);
	}
	
}
