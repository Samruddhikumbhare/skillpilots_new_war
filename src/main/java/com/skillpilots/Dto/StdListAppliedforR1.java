package com.skillpilots.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class StdListAppliedforR1 {
	private Long id;
    private String status;
    private String email;
    private String applyDate; // Rename to camelCase to match Java naming conventions
    private String username;
    @JsonProperty("company_name")
    private String companyName; // Rename to camelCase
    private Long placementId;
    private Long placement_id;
    private String apply_date;
    private Long company_id;
}
