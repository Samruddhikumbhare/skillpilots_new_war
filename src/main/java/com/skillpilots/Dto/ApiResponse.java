package com.skillpilots.Dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
@Data
public class ApiResponse {
	 private String msg;
	    private List<Placement> placements;
	    
	    private List<PlacementAppliedStudent> data;

		public List<StdListApplied> getStudents() {
			// TODO Auto-generated method stub
			return null;
		}
		  private int currentPage;
		    private int totalPages;
		    private int size; 
		
}
