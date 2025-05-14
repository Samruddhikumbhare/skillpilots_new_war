package com.skillpilots.Dto;

import java.time.LocalDate;

import lombok.Data;
@Data
public class TeamDto {

	
	    private Long compDeptLinkId;
	    private String deptName;
	    private Long managerId;
	    private String managerName;
	    private Long internshipLeadId;
	    private String leadName;
	    private String teamName;
	    private Long companyId;
	    private String status;
	    private Long commonId;
	    private LocalDate creationDate;
	    private LocalDate effectiveDate;
	    private LocalDate expirationDate;
	    private LocalDate updationDate;

	    // Getters and setters
	

}
