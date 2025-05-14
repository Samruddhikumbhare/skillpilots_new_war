package com.skillpilots.Dto;

import lombok.Data;

@Data
public class Placement {
	 private int placementId;
	    private String companyName;
	    private long contactNo;
	    private String email;
	    private String address;
	    private String profile;
	    private String departmentIds;
	    private PlacementDetails placementDetails;
	    private String creationDate;
	    private String status;
	    private int collegeId;
	    private String ctc;
}
