package com.skillpilots.Dto;
import java.time.LocalDate;

import lombok.Data;
@Data
public class Recruitment {
	  private String recruitmentStatus;
	    private PlacementDetails placementDetails;

	    
		@Data
	    public static class PlacementDetails {
	        private String address;
	        private String ctc;
	        private Long placementId;
	        private String companyName;
	        private String profile;
	        private Long collegeId;
	        private String departmentIds;
	        private String creationDate;
	        private String email;
	        private Long contactNo;
	        private String status;
}
}
