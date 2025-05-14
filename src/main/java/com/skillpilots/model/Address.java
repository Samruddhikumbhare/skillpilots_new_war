package com.skillpilots.model;



import java.time.LocalDate;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "address_data")
public class Address {
	
	  
	@Id
	@Column(name = "address_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long address_id;
	private String line_1;
	private String line_2;
	private String city;
	private String state;
	private String country;
	private Integer pincode;
	private LocalDate creation_date;
	private LocalDate updation_date;

	
	
   
}
