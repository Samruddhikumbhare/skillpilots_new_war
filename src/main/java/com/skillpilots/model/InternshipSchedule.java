package com.skillpilots.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import jakarta.persistence.Table;
@Entity
@Table(name = "internship_schedule")
public class InternshipSchedule {
	@Id
	@Column(name="schedule_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int schedule_id;
	private String internship_group_id;
	public String getGroup_id() {
		return internship_group_id;
	}
	public void setGroup_id(String group_id) {
		this.internship_group_id = group_id;
	}

	private String schedule_type;
	private String schedule_1;
	private String schedule_2;
	private String schedule_3;
	private String schedule_4;
	@ManyToOne
	@JoinColumn(name="advertisement_id")
	private CompAdvertisement compAdvertisement;
	public CompAdvertisement getCompAdvertisement() {
		return compAdvertisement;
	}
	public void setCompAdvertisement(CompAdvertisement compAdvertisement) {
		this.compAdvertisement = compAdvertisement;
	}
	
	/*@ManyToOne
	@JoinColumn(name="internship_id")
	private Internships internships;
	public Internships getInternships() {
		return internships;
	}
	public void setInternships(Internships internships) {
		this.internships = internships;
	}*/
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getSchedule_type() {
		return schedule_type;
	}
	public void setSchedule_type(String schedule_type) {
		this.schedule_type = schedule_type;
	}
	public String getSchedule_1() {
		return schedule_1;
	}
	public String getSchedule_2() {
		return schedule_2;
	}
	public String getSchedule_3() {
		return schedule_3;
	}
	public String getSchedule_4() {
		return schedule_4;
	}
	public boolean setSchedule(String schedule) {
		if(null == schedule_1 || schedule_1 == "")
			this.schedule_1 = schedule;
		else if(null == schedule_2 || schedule_2 == "")
			this.schedule_2 = schedule;
		else if(null == schedule_3 || schedule_3 == "")
			this.schedule_3 = schedule;
		else if(null == schedule_4 || schedule_4 == "") {
			this.schedule_4 = schedule;
			return false;	//schedule row completed
		}
		// Schedule Set
		return true;
	}
	public void clearSchedule() {
		schedule_1 = schedule_2 = schedule_3 = schedule_4 = null;
	}
}
