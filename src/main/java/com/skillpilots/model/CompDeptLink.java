package com.skillpilots.model;

import java.time.LocalDate;
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
@Table(name = "comp_dept_link")
public class CompDeptLink {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="comp_dept_link_id")
	private Long comp_dept_link_id;
	private Long company_id;
	private Long commonId;
	private String dept_name;
	private LocalDate creation_date;
	private Date updation_date;
	private Long manager_id;
	private LocalDate effective_date;
	private Date expiration_date;
	private Long internship_lead_id;
	private String status;
	
	
}
