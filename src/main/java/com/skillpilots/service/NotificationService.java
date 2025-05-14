package com.skillpilots.service;

import java.util.List;
import java.util.Optional;

import com.skillpilots.model.NotificationRequest;

public interface NotificationService {

	
	public NotificationRequest addNotification(NotificationRequest request);
	
	public List<NotificationRequest> getNotifications(Long id);
	

	public Optional<NotificationRequest> markAsRead(Long id);
}
