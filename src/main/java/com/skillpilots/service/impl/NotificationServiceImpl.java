package com.skillpilots.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.NotificationRequest;
import com.skillpilots.repository.NotificationRepository;
import com.skillpilots.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationRepository notificationRepository;

	@Override
	public NotificationRequest addNotification(NotificationRequest request) {
		return notificationRepository.save(request);
	}

	@Override
	public List<NotificationRequest> getNotifications(Long id) {
		
		return notificationRepository.findByReceiverIdOrderByNotifIdDesc(id);
	}

	@Override
		public Optional<NotificationRequest> markAsRead(Long id) {
			Optional<NotificationRequest> notification = notificationRepository.findById(id);
			notification.ifPresent(n ->
			
			{ n.setStatus(true); notificationRepository.save(n); }); return notification; }
		
	
	

}
