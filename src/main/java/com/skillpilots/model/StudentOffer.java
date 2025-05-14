package com.skillpilots.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class StudentOffer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long offerId;
	private Long studentId;
	private Long companyId;
	private String fileName;
	private String status = "P";
}