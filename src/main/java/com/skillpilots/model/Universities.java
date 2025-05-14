package com.skillpilots.model;
import java.time.LocalDate;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
@Data
@Entity
public class Universities
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
    private String boardName;
    private LocalDate createdAt;
}