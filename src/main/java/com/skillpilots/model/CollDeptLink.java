package com.skillpilots.model;

import java.time.LocalDate;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name="coll_dept_link")
public class CollDeptLink {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="coll_dept_link_id")
private Long coll_dept_link_id;
private Long college_id;
@Column(name = "dept_id")
private Long deptId;
private Long head_id;
private Long commonId;
private LocalDate creation_date;
private Date updation_date;
private Long iii_dept_co_id;
private Long balance_data_id;
private Date effective_date;
private Date expiration_date;
private String status;



}
