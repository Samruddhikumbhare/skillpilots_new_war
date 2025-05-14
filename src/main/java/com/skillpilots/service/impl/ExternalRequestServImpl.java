package com.skillpilots.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.ExternalRequest;
import com.skillpilots.repository.ExternalRequestRepository;
import com.skillpilots.service.ExternalRequestService;
@Service
public class ExternalRequestServImpl implements ExternalRequestService {
	
	@Autowired
	private ExternalRequestRepository externalRequestRepository;

	@Override
	public ExternalRequest saveExternalRequest(ExternalRequest externalRequest) {
		return externalRequestRepository.save(externalRequest);
	}

	@Override
	public List<Object[]> getExternal_req(Long userid, Date expiration_date) {
		return externalRequestRepository.getExternal_req(userid,expiration_date);
	}

	@Override
	public ExternalRequest getExternalRequestByERid(Long request_id) {
		return externalRequestRepository.findById(request_id).orElseThrow(()-> new RuntimeException("External Request Not found "+request_id));
	}

	@Override
	public List<Object[]> getExternal_reqs(Long userid,Date expiration_date) {
		return externalRequestRepository.getExternal_reqs(userid,expiration_date);
	}

	@Override
	public ExternalRequest getExternalRequest(Long for_user_id, Long request_id
			) {
		// TODO Auto-generated method stub
		return externalRequestRepository.getExternalRequest(for_user_id,  request_id, new Date());
	}

}
