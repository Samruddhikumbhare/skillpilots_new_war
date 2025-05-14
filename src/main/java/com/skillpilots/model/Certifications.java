package com.skillpilots.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import lombok.Data;

@Entity
@Data
public class Certifications {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String issuueDate;
	private String companyName;
	private String url;
	private Long userId;
	private String createdAt;
	
	@PrePersist
	public void uploadAt() {
		
		DateTimeFormatter formatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
	this.createdAt=	LocalDate.now().format(formatter);
	}
	

}
