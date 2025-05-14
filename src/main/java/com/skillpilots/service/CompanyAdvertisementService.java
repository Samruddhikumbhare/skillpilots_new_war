package com.skillpilots.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skillpilots.model.CompAdvertisement;

@Service
public interface CompanyAdvertisementService {
	
	public CompAdvertisement saveCompAdvertisement(CompAdvertisement compAdvertisement);
	
	public CompAdvertisement getCompAdv(Long advertisement_id);

	public List<CompAdvertisement> getAdvertisement( String condition
            );

	List<CompAdvertisement> findByLocationOrderByLocation(String location);


}
