package com.skillpilots.Dto;

import lombok.Data;
import java.util.List;

@Data
public class RecruitmentResponse {
    private String message;
    private List<StdListAppliedforR1> data;
}
