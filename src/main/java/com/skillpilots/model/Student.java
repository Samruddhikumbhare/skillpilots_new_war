package com.skillpilots.model;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "student_data")
@Transactional
public class Student {
	@Id
	@Column(name = "student_id")
	private Long student_id;
	private String student_name;
	private Date creation_date;
	private Date updation_date;

	private LocalDate d_o_b;
	private String email_id;
	private Long contact;
	// private String photo;
	@Lob
	@Column(length = 1048576) // Adjust the length as needed
	private byte[] photo;
	private Date effective_date;
	private Date expiration_date;
	private String curr_city;
	private String home_city;
	private String curr_year;
	private String curr_enroll_no;
	private Date valid_till;
	private String skills;
	private String interest;
	private String hobbies;
	private String achievements;
	private String request_status;
	private String device_id;
	private Long college_id;
	private String dept;
	private String resume;

	@Lob
	@Column(columnDefinition = "TEXT")
	private String linkedIn;

	@Lob
	@Column(columnDefinition = "TEXT")
	private String about;

	@OneToMany(mappedBy = "student", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonManagedReference
	private List<StudentPast> studentPast;

	@Override
	public String toString() {
		return "Student{" + "student_id=" + student_id + ", student_name='" + student_name + '\'' + ", email_id='"
				+ email_id + '\'' + ", contact=" + contact + ", curr_city='" + curr_city + '\'' + ", home_city='"
				+ home_city + '\'' + ", curr_year='" + curr_year + '\'' + ", curr_enroll_no='" + curr_enroll_no + '\''
				+ ", skills='" + skills + '\'' + ", interest='" + interest + '\'' + ", hobbies='" + hobbies + '\''
				+ ", achievements='" + achievements + '\'' + ", dept='" + dept + '\'' +

				'}';
	}

}
