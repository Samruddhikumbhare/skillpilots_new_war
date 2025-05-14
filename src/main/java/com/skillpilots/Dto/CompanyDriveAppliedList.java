package com.skillpilots.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class CompanyDriveAppliedList {
		private String status;
	    private String email;
	    
	    @JsonProperty("company_name")
	    private String companyName;
	    
	    @JsonProperty("apply_date")
	    private String applyDate;
	    
	    private String username;
	    @JsonProperty("job_role")
	    private String jobRole;
	    
	    @JsonProperty("drive_id")
	    private Long driveId;
	    
	    private Long id;
}
