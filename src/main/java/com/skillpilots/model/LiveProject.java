package com.skillpilots.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.PrePersist;
import lombok.Data;

@Entity
@Data
public class LiveProject {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String title;
	    @Lob
	    @Column(name = "description", columnDefinition = "TEXT")
	    private String description;

	    private String githubLink;
	    private String filePath;
	    
	    private Long userId;
	    private String createdAt;
	    @PrePersist
	    public void createdAt(){

	        DateTimeFormatter dateTimeFormatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        this.createdAt= LocalDate.now().format(dateTimeFormatter);
	    }
	    
}
