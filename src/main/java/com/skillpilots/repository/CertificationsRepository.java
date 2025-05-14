package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.Certifications;

public interface CertificationsRepository extends JpaRepository<Certifications, Long>{

	List<Certifications> findByUserIdOrderByIdDesc(Long userId);
}
