package com.skillpilots.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="reg_user")
public class RegUser {

	@Id
	/*@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "user_generator")
	@SequenceGenerator(name="user_generator", sequenceName = "user_id_seq", allocationSize=1)*/
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long user_id;
	private String psswrd_data;
	private Date creation_date;
	private Date updation_date;
	private Date effective_date;
	private Date expiration_date;
	private String expiration_rsn;
	private String email_id;
	private int role;
	private Date last_login;
	private String temp_pass;
	private int login_attempt;
	private String institute_id;
	private boolean acc_verified;
	private boolean email_verified;
	private boolean mob_verified;
	private String username;
	private Long contact_no;
	private String user_text;
	private String gender;
	private byte[] signature;
	
}
