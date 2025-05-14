package com.skillpilots.Dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class StdListAppliedforDrive {

    @JsonProperty("id")
    private Long studentId;
    
    @JsonProperty("username")
    private String studentName;
    
    private String status;
}
