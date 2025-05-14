package com.skillpilots.service;

import com.skillpilots.model.PaymentHistory;

public interface PaymentHistoryService {

	public PaymentHistory getPayment(Long userId);
	
	public PaymentHistory save(PaymentHistory paymentHistory);
}
