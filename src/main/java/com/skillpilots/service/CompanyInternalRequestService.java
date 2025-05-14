package com.skillpilots.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.skillpilots.model.CompanyInternalRequest;

public interface CompanyInternalRequestService {

	 CompanyInternalRequest save(CompanyInternalRequest compRequ);

	 List<CompanyInternalRequest> findAll();

	
	boolean existsById(Long requestId);

	CompanyInternalRequest getCompanyRequestById(Long requestId);

	List<CompanyInternalRequest> findAll(Long commonId);

	void saveCompanyInternalRequest(CompanyInternalRequest compInternalRequest);


	public List<Object[]> getInternalReqByRole(Long company_id,Date expiration_date,String status) ;


	
	public List<Object[]> getInternalReqByRoleManagerOrLead(Long company_id,String status,Long user_id) ;

	CompanyInternalRequest getCompInternal_Req(Long request_id);

	CompanyInternalRequest getCompIntReqFromExtReqId(Long against_request);

	public List<Object[]> getInternalLastThreeReqByRole(Long company_id,String status);







}
