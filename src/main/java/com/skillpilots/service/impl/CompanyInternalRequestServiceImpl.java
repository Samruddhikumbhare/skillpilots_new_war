package com.skillpilots.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.repository.CompanyInternalRequestRepository;
import com.skillpilots.service.CompanyInternalRequestService;
@Service
public class CompanyInternalRequestServiceImpl implements CompanyInternalRequestService{
@Autowired
private CompanyInternalRequestRepository companyInternalRequestRepository;
	@Override
	public CompanyInternalRequest save(CompanyInternalRequest compRequ) {
		
		return companyInternalRequestRepository.save(compRequ);
	}
	@Override
	public List<CompanyInternalRequest> findAll() {
		// TODO Auto-generated method stub
		return companyInternalRequestRepository.findAll();
	}
	@Override
	public boolean existsById(Long requestId) {
	    // Attempt to find an entity by its ID
	    Optional<CompanyInternalRequest> entity = companyInternalRequestRepository.findById(requestId);
	    // Return true if the entity exists, false otherwise
	    return entity.isPresent();
	}
	@Override
	public CompanyInternalRequest getCompanyRequestById(Long requestId) {
		return companyInternalRequestRepository.findById(requestId).orElseThrow(()-> new RuntimeException("Company not found"));
	}
	@Override
	public List<CompanyInternalRequest> findAll(Long commonId) {
		// TODO Auto-generated method stub
		return companyInternalRequestRepository.getRequestByUser(commonId);
	}
	@Override
	public void saveCompanyInternalRequest(CompanyInternalRequest compInternalRequest) {
		companyInternalRequestRepository.save(compInternalRequest);
		
	}
	@Override
	public List<Object[]> getInternalReqByRole(Long company_id, Date expiration_date,String status) {
		return companyInternalRequestRepository.getInternalReqByRole(company_id, expiration_date,status);
	}
	@Override
	public List<Object[]> getInternalReqByRoleManagerOrLead(Long company_id, String status,Long user_id) {
		return companyInternalRequestRepository.getInternalReqByRoleManager(company_id,  status,user_id);
	}
	@Override
	public CompanyInternalRequest getCompInternal_Req(Long request_id) {
		// TODO Auto-generated method stub
		return companyInternalRequestRepository.findById(request_id).orElseThrow(()-> new RuntimeException("CompanyRequest Not found"));
	}
	@Override
	public CompanyInternalRequest getCompIntReqFromExtReqId(Long against_request) {
		// TODO Auto-generated method stub
		return companyInternalRequestRepository.getCompIntReqFromExtReqId(against_request);
	}
	@Override
	public List<Object[]> getInternalLastThreeReqByRole(Long company_id, String status) {
		// TODO Auto-generated method stub
		return companyInternalRequestRepository.getInternalLastThreeReqByRole(company_id, status);
	}




}
