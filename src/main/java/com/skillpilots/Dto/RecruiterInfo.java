package com.skillpilots.Dto;

import lombok.Data;

@Data
public class RecruiterInfo {
    private Long company_id;
    private String lead_email;
    private String manager_name;
    private String manager_email;
    private Long manager_id;
    private String lead_name;
    private Long internship_lead_id;
}
