package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.model.BalanceData;

public interface BalanceDataRepository extends JpaRepository<BalanceData, Long>{

	@Query(value="select * from balance_data where user_id=:company_id and balancefor=:balancefor", nativeQuery = true)
	BalanceData getBalanceDataByCompany(Long company_id,String balancefor);

	@Query("select balance.balance_data_id, balance.package_id, balance.creation_date, " +
	        "balance.expiration_date, balance.payment_mode, balance.no_of_internships, " +
	        "balance.no_of_dept, package.package_name, package.no_of_internships, " +
	        "package.no_of_dept " +
	        "from BalanceData balance, PackagesData package " +
	        "where balance.user_id = :user_id AND balance.balancefor = :balancefor " +
	        "AND package.package_id = balance.package_id")
	List<Object[]> getBalanceDetails(Long user_id, String balancefor);
	
	@Query("select cd.deptId, cd.creation_date, cd.expiration_date, cd.status, dept.dept_name " +
		       "from CollDeptLink cd, Department dept " +
		       "where cd.balance_data_id = :balance_data_id AND dept.deptId = cd.deptId")
		public List<Object[]> getBalanceUsage(Long balance_data_id);


}
