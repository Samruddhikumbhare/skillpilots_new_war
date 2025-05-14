package com.skillpilots.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

import com.fasterxml.jackson.annotation.JsonFormat;
@Data
@Entity
@Table(name="technologies")
public class Technologies {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long tech_id;


private String technology_name;



}
