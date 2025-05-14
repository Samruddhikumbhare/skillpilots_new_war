package com.skillpilots.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.LiveChat;
import com.skillpilots.repository.LiveChatRepository;
import com.skillpilots.service.LiveChatService;
@Service
public class LiveChatServiceImpl implements LiveChatService{

	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private LiveChatRepository liveChatRepository;
	@Override
	public List<LiveChat> getAllChat(String sender_id, String receiver_id) {
		System.out.println("senderID="+sender_id);
		String sql = "FROM LiveChat where (sender_id=:sender_id and receiver_id=:receiver_id) OR (sender_id=:receiver_id and receiver_id=:sender_id)";
		@SuppressWarnings("deprecation")
		Query query = sessionFactory.openSession().createQuery(sql);
		query.setParameter("sender_id", sender_id);
		query.setParameter("receiver_id", receiver_id);
	
		return query.list();
	}
	@Override
	public void save(LiveChat chatMessage) {
		// TODO Auto-generated method stub
		liveChatRepository.save(chatMessage);
	}
//	@Override
//	public List<LiveChat> getChatMessages(Long senderId, Long receiverId) {
//		// TODO Auto-generated method stub
//		return liveChatRepository.findBySenderIdAndReceiverId(senderId, receiverId);
//	}
	@Override
	public List<LiveChat> findChatMessagesBySenderAndReceiver(Long senderId, Long receiverId) {
		// TODO Auto-generated method stub
		return liveChatRepository.findChatMessagesBySenderAndReceiver(senderId, receiverId);
	}



}
