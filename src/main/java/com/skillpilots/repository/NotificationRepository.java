package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.NotificationRequest;

public interface NotificationRepository extends JpaRepository<NotificationRequest, Long>{

	
    List<NotificationRequest> findByReceiverIdOrderByNotifIdDesc(Long receiverId);
	
}
