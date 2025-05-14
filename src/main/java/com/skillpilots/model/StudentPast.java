package com.skillpilots.model;

import java.util.Date;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
@Data
@Entity
@Table(name="students_past")
public class StudentPast {
	@Id
	@Column(name="stud_past_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long stud_past_id;
	Long student_id;
	String category;
	String profile;
	String organization;
	String board;
	Long department;
	String location;
	String start_date;
	String end_date;
	String description;
	String link;
	Date creation_date;
	Date updation_date;
	String stream;
	
	@ManyToOne
    @JoinColumn(name = "student_id", insertable = false, updatable = false)  // Use student_id as the foreign key
    @JsonBackReference
	private Student student;
	
	@Override
	  public String toString() {
	      return "StudentPast{" +
	              "stud_past_id=" + stud_past_id +
	              ", category='" + category + '\'' +
	              ", profile='" + profile + '\'' +
	              ", organization='" + organization + '\'' +
	              ", location='" + location + '\'' +
	              ", start_date='" + start_date + '\'' +
	              ", end_date='" + end_date + '\'' +
	              ", description='" + description + '\'' +
	              ", link='" + link + '\'' +
	              ", stream='" + stream + '\'' +
	              '}';
	  }
}
