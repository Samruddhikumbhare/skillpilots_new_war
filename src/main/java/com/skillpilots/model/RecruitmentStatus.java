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
public class RecruitmentStatus {

	
	    @Id 
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long statusId;
	    private String status;
	    private String applyDate;
	    private Long studentId;
	    private String round;
	    private String roundTime;
	    private String roundDate;
	    private Long collegeId;
	    private Long companyId;
	    private Long driveId;
	    private Long reqruitmentId;

	    @PrePersist
	    private void creatDate(){
	      DateTimeFormatter formatter=  DateTimeFormatter.ofPattern("yyyy-MM-dd");
	      this.applyDate= LocalDate.now().format(formatter);
	    }
}
