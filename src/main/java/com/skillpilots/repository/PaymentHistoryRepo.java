package com.skillpilots.repository;
 
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.PaymentHistory;

public interface PaymentHistoryRepo extends  JpaRepository<PaymentHistory, Long>{
 
	PaymentHistory findByUserId(Long userId);
//	@Query("SELECT p.receiptNumber FROM PaymentHistory p ORDER BY p.historyId DESC LIMIT 1")
//	String findLastReceiptNumber();

	@Query("SELECT p.receiptNumber FROM PaymentHistory p WHERE p.receiptNumber LIKE CONCAT('SP/', :financialYear, '/%') ORDER BY p.receiptNumber DESC LIMIT 1")
	String findLastReceiptNumber(@Param("financialYear") String financialYear);

    @Query("SELECT p FROM PaymentHistory p WHERE p.userId = :userId AND p.status <> 'SUCCESS' ORDER BY p.paymentDate DESC limit 1")
	    Optional<PaymentHistory> findLatestPendingPaymentByUserId(Long userId);
	
    PaymentHistory findTopByUserIdAndStatusOrderByPaymentDateDesc(Long userId, String status);

    PaymentHistory findByUserIdAndStatus(Long userId, String status);

}
