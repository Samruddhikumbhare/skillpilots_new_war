package com.skillpilots.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class PlacementAppliedStudent {
private String status;
private String email;
@JsonProperty("company_name")
private String companyName;
@JsonProperty("apply_date")
private String applyDate;
private String username;

@JsonProperty("job_role")
private String jobRole;
@JsonProperty("placement_id")
private Long placementId;

private Long id;
private long contactNo;
private String website;
private String contactName;
private String hsc;
private String ssc;
private String ug;
private String address;
private String profile;
private String departmentIds;
private PlacementDetails placementDetails;
private String creationDate;

private int collegeId;
}
