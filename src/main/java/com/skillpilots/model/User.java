package com.skillpilots.model;

import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToMany;
import lombok.Data;

//User.java
@Entity
@Data
public class User {
 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;

 private String username;
 private String password;
 private String plainPassword;

 private String email;
 private String otp;
 private String photo;
 @Lob
 @Column(length = 1048576) // Adjust the length as needed
 private byte[] signature;
 private Long department;
 private Long contact_no;
 private String team_name;   // this used temrory because this field come from another table please check latter
 private short type;
 private String gender;
 private Long commonId;
 private Long instituteId;
 private int hodverified = 0;
 private int college_id;
 private String temp_pass;
 private String emailIdCommon;
 
 private String expiration_rsn;
 @Column(name = "login_attempt")
 private Integer loginAttempt=0;
 @Column(name = "last_failed_login_attempt")
 private LocalDateTime lastFailedLoginAttempt;
 
 
 private String notificationToken;
 
 
 public boolean isAccountLocked() {
     if (this.lastFailedLoginAttempt == null) {
         return false;
     }
     return this.loginAttempt >= 3 && this.lastFailedLoginAttempt.plusHours(24).isAfter(LocalDateTime.now());
 }
 
 public boolean canUnlockAccount() {
     if (this.lastFailedLoginAttempt == null) {
         return false;
     }
     return this.loginAttempt >= 3 && this.lastFailedLoginAttempt.plusHours(12).isBefore(LocalDateTime.now());
 
 }
public User() {
}

private String role;
 
 private int verified;
 
 public String getName() {
	 return username;
 }

}
