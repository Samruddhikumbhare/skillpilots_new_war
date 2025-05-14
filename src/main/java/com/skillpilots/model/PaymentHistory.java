package com.skillpilots.model;

import java.time.LocalDate;

import org.hibernate.annotations.CurrentTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PaymentHistory {

	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private  Long historyId;
	    private double paidAmount;
	    private String paymentType; 
	    // e.g., "CASH", "ONLINE"
	    @CurrentTimestamp
	    private LocalDate paymentDate;
	    private String status;
	    private Long userId;
	    
	    private String receiptNumber;
}
