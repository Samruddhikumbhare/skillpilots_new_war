package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.Certificates;

public interface CertificateRepository extends JpaRepository<Certificates, Long> {

	

}
