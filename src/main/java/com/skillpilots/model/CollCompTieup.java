package com.skillpilots.model;

import java.time.LocalDate;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@NoArgsConstructor
@Data
@Table(name = "coll_comp_tieup")
public class CollCompTieup {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "tieup_id")
	private Long tieup_id;
	private Long college_id;
	private Long company_id;
	private String company_name;
	private String college_name;
	private LocalDate creation_date;
	private LocalDate updation_date;
	private LocalDate effective_date;
	private LocalDate expiration_date;
	private String requested_by;
	private String status;
	private Long institute_id;

	 @PrePersist
	    protected void onCreate() {
	        this.creation_date = LocalDate.now();
	    }
	 @PreUpdate
	    protected void onUpdate() {
	        this.updation_date = LocalDate.now();
	    }
}
