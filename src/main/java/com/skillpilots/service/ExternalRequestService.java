package com.skillpilots.service;

import java.util.Date;
import java.util.List;

import com.skillpilots.model.ExternalRequest;

public interface ExternalRequestService {
	
	public ExternalRequest saveExternalRequest(ExternalRequest externalRequest);

	
	public List<Object[]> getExternal_req(Long userid,Date expiration_date);


	public ExternalRequest getExternalRequestByERid(Long request_id);
	
	public List<Object[]> getExternal_reqs(Long userid,Date expiration_date) ;
	
	public ExternalRequest getExternalRequest(Long for_user_id, Long request_id);



}
