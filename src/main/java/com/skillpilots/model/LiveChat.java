package com.skillpilots.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name = "live_chat")
public class LiveChat {

	@Id
	@Column(name="chat_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long chat_id;
	private String message;

    @Column(name = "sender_id") // This line maps the field to the column named sender_id in the database.
    private Long senderId;

    @Column(name = "receiver_id") // This line maps the field to the column named receiver_id in the database.
    private Long receiverId;
    
	private String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm"));
	
}
