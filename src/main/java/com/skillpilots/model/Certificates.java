package com.skillpilots.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
public class Certificates {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private Long studentId;
	    private String url;

	    // Constructors, getters, and setters

	    public Certificates() {}

	    public Certificates(Long studentId, String url) {
	        this.studentId = studentId;
	        this.url = url;
	    }

}
