package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.BalanceData;

public interface BalanceDataService {
	
	BalanceData saveBalance(BalanceData balanceData);

	BalanceData getBalanceDataByCompany(Long company_id,String balancefor);
	
	BalanceData getBalanceData(Long balance_data_id);

	List<Object[]> getBalanceDetails(Long user_id,String balancefor);

	List<Object[]> getBalanceUsage(Long balance_id);

	

}
