package com.skillpilots.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.BalanceData;
import com.skillpilots.repository.BalanceDataRepository;
import com.skillpilots.service.BalanceDataService;
@Service
public class BalanceDataSerImpl implements BalanceDataService {

	@Autowired
	private BalanceDataRepository balanceDataRepository;
	
	
	@Override
	public BalanceData saveBalance(BalanceData balanceData) {
		return balanceDataRepository.save(balanceData);
	}


	@Override
	public BalanceData getBalanceDataByCompany(Long company_id,String balancefor) {
		return balanceDataRepository.getBalanceDataByCompany(company_id, balancefor);
	}


	@Override
	public BalanceData getBalanceData(Long balance_data_id) {
		return balanceDataRepository.findById(balance_data_id).orElseThrow(()-> new RuntimeException("balance not found"));
	}


	@Override
	public List<Object[]> getBalanceDetails(Long user_id, String balancefor) {
		return balanceDataRepository.getBalanceDetails(user_id, balancefor);
	}


	@Override
	public List<Object[]> getBalanceUsage(Long balance_id) {
		// TODO Auto-generated method stub
		return balanceDataRepository.getBalanceUsage(balance_id);
	}

}
