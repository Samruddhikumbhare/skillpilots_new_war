package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.PaymentHistory;
import com.skillpilots.repository.PaymentHistoryRepo;
import com.skillpilots.service.PaymentHistoryService;

@Service
public class PaymentServiceImpl implements PaymentHistoryService {

	@Autowired
	private PaymentHistoryRepo paymentHistoryRepo;
	
	
	@Override
	public PaymentHistory getPayment(Long userId) {
		return paymentHistoryRepo.findByUserId(userId);
	}


	@Override
	public PaymentHistory save(PaymentHistory paymentHistory) {
		return paymentHistoryRepo.save(paymentHistory);
	}

}
