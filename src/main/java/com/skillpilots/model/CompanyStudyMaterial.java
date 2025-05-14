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
public class CompanyStudyMaterial {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long studyMaterialId;
	private String topic;
	private String description;
	private String uploadUrl;
	private String videourl;
	private String fileName;
	private String createdDate;
	private Long companyId;
	@PrePersist
	public void onCreate() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		this.createdDate = LocalDate.now().format(formatter);
	}
}
