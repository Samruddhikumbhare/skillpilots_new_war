package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.ProgressData;
import com.skillpilots.repository.ProgressDataRepository;
import com.skillpilots.service.ProgressDataService;
@Service
public class ProgressDataServicImpl  implements ProgressDataService{
	@Autowired
	private ProgressDataRepository  progressDataRepository;

	@Override
	public ProgressData getProgressData(Long internship_id) {
		return progressDataRepository.getProgressData(internship_id);
	}

}
