package com.skillpilots.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Certificates;
import com.skillpilots.repository.CertificateRepository;
import com.skillpilots.service.CertificateService;
@Service
public class CertificateServiceImpl implements CertificateService {

	@Autowired
	private CertificateRepository certificateRepository;
	
	
	



	@Override
	public void save(Certificates certificate) {
		// TODO Auto-generated method stub
		certificateRepository.save(certificate);
	}

}
