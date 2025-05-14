package com.skillpilots.model;

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
@Table(name = "balance_data")
public class BalanceData {
	private Long user_id;
	private int package_id;
	private Date creation_date;
	private Date updation_date;
	private Date payment_date;
	private Date effective_date;
	private Date expiration_date;
	private String payment_mode;
	private String transaction_id;
	@Id
	@Column(name = "balance_data_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long balance_data_id;
	private int no_of_dept;
	private int no_of_internships;
	private String balancefor;
	
}
