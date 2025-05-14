package com.skillpilots.Dto;

import java.sql.Date;

import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;

import lombok.Data;

//Combined DTO for Student and StudentPast
@Data
public class StudentDetailsDTO {
 private Long studentId;
 private String studentName;
 private Date creationDate;
 private Date updationDate;
 private Date dob;
 private String emailId;
 private Long contact;
 private byte[] photo;
 private Date effectiveDate;
 private Date expirationDate;
 private String currCity;
 private String homeCity;
 private String currYear;
 private String currEnrollNo;
 private Date validTill;
 private String skills;
 private String interest;
 private String hobbies;
 private String achievements;
 private String requestStatus;
 private String deviceId;
 private Long collegeId;
 private String dept;

 private Long studPastId;
 private String category;
 private String profile;
 private String organization;
 private String board;
 private String department;
 private String location;
 private String startDate;
 private String endDate;
 private String description;
 private String link;
 private Date pastCreationDate;
 private Date pastUpdationDate;


}
