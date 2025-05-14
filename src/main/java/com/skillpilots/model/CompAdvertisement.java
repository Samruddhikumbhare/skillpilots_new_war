package com.skillpilots.model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name = "advertisements_comp")
public class CompAdvertisement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "company_id")
	private Long companyId;
	private Long commonId;
	private String companyName;
	private String technology;
	private LocalDate creation_date;
	private LocalDate updation_date;
//	@JsonFormat(pattern=ProjectConstants.date_format)
	private LocalDate effective_date;
//	@JsonFormat(pattern=ProjectConstants.date_format)
	private LocalDate expiration_date;
	
	
	@Lob
	@Column(columnDefinition = "TEXT")
	private String description;

	private Integer capacity;
	private Integer duration;
	private String status;
	private double stipend;
	
	private LocalDate start_date;
	private String adv_title;
	private String requirement;
	private String location;
	
	private String advertisementType;
     private String jobType;
	
	private String workingType;
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL,mappedBy="compAdvertisement")
	private List<InternshipSchedule> internshipSchedule;
	
	

	
	

}
