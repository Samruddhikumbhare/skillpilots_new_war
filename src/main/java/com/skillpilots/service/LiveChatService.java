package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.LiveChat;

public interface LiveChatService {

	List<LiveChat> getAllChat(String sender_id, String receiver_id);

	void save(LiveChat chatMessage);

//	List<LiveChat> getChatMessages(Long senderId, Long receiverId);

	List<LiveChat> findChatMessagesBySenderAndReceiver(Long senderId, Long receiverId);

	

}
