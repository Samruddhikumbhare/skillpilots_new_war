package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.LiveChat;

public interface LiveChatRepository extends JpaRepository<LiveChat, Long> {

//	
//	 @Query("SELECT lc FROM LiveChat lc WHERE lc.senderId = :senderId AND lc.receiverId = :receiverId")
//	    List<LiveChat> findBySenderIdAndReceiverId(@Param("senderId") Long senderId, @Param("receiverId") Long receiverId);

	@Query("SELECT c FROM LiveChat c WHERE (c.senderId = :senderId AND c.receiverId = :receiverId) OR (c.senderId = :receiverId AND c.receiverId = :senderId) ORDER BY c.timestamp ASC")
	List<LiveChat> findChatMessagesBySenderAndReceiver(@Param("senderId") Long senderId, @Param("receiverId") Long receiverId);

}
