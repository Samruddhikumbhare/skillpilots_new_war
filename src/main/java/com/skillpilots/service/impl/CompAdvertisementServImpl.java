package com.skillpilots.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.repository.CompAdvertismentRepo;
import com.skillpilots.service.CompanyAdvertisementService;
import com.skillpilots.utility.ProjectConstants;

@Service
public class CompAdvertisementServImpl implements CompanyAdvertisementService {
	
	
	@Autowired
	private CompAdvertismentRepo compAdvertismentRepo;
	
	@Override
	public CompAdvertisement saveCompAdvertisement(CompAdvertisement compAdvertisement) {
		return compAdvertismentRepo.save(compAdvertisement);
	}

	@Override
	public CompAdvertisement getCompAdv(Long advertisementId) {
		return compAdvertismentRepo.findById(advertisementId).orElseThrow(()-> new RuntimeException("Advertisement Not found"));
	}

	@Override
	public List<CompAdvertisement> getAdvertisement(String condition) {
		System.out.println(">>>>>>>>>>" + condition);
        List<CompAdvertisement> results = compAdvertismentRepo.findByCustomConditionsAndExpirationDateAfterAndStatus(condition, new Date(), ProjectConstants.comp_advertisements_status_active);
        return results;
	}

	@Override
	public List<CompAdvertisement> findByLocationOrderByLocation(String location) {
		 List<CompAdvertisement> cityAdvertisements = compAdvertismentRepo.findByLocationOrderByLocation(location);

	        // Fetch rest of the advertisements (excluding those related to student's city)
	        List<CompAdvertisement> otherAdvertisements = compAdvertismentRepo.findByLocationNotOrderByLocation(location);

	        // Combine both lists, putting city advertisements first
	        cityAdvertisements.addAll(otherAdvertisements);
	        return cityAdvertisements;
	}

	

	
	

	

}
