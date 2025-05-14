package com.skillpilots.Dto;

import java.util.List;
import lombok.Data;

@Data
public class StdListAppliedResponse {
    private String message;
    private List<StdListApplied> data;
    
}
