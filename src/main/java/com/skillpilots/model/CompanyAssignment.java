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
public class CompanyAssignment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String filePath;
	private Long studentId;
	private String description;
	private Long companyId;
	private String createdAt;
	
	
	
	@PrePersist
	public void createDate() {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.createdAt = LocalDate.now().format(formatter);
	}	
}
