package com.skillpilots.Dto;

import lombok.Data;

@Data
public class PaymentRequestEntity {
	  private String orderId;          // Unique identifier for the order
	    private String orderAmount;      // The amount to be paid
	    private String returnUrl;        // URL to redirect after payment
	    private String orderNote;        // A note related to the order
	    private String customerEmail;    // Customer email (optional)
	    private String customerPhone;
}
