package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CollCompTieup;
import com.skillpilots.model.User;
import com.skillpilots.repository.TieUpRepository;
import com.skillpilots.service.TieUpService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
@Service
public class TieUpServiceImpl implements TieUpService {

	@Autowired
	private TieUpRepository tieUpRepository;

	@Autowired
	private HttpSession session;
	@Override
	public void saveTieUpRequest(Long companyId, Long collegeId,String companyName) {
		User user = (User) session.getAttribute("user");
		
		CollCompTieup tieUpRequest = new CollCompTieup();
		tieUpRequest.setCompany_name(companyName);
		tieUpRequest.setCollege_id(collegeId);
		tieUpRequest.setCompany_id(companyId);
		tieUpRequest.setStatus("pending");
		tieUpRequest.setCollege_name(user.getUsername());
		tieUpRequest.setRequested_by("CL");
		tieUpRepository.save(tieUpRequest);
			}
	@Override
	public List<CollCompTieup> getAllReceiveCompany(Long collegeId,String requested_by) {
		// TODO Auto-generated method stub
		return tieUpRepository.findAllReceiveComp(collegeId,requested_by);
	}
	@Override
	@Transactional
	public void updateStatus(Long tieupId, String status,LocalDate date) {
		
		tieUpRepository.updateStatusById(tieupId, status,date);
	}
	@Override
	public List<CollCompTieup> getAllTieCompany(Long collegeId,String requested_by) {
		// TODO Auto-generated method stub
		return tieUpRepository.findTieComp(collegeId,requested_by);
	}
	@Override
	public List<CollCompTieup> getAllTieCompanesByStatus(Long collegeId,String requested_by) {
		// TODO Auto-generated method stub
		 List<CollCompTieup> findPendingTieups = tieUpRepository.findAllByStatus3(collegeId,requested_by);
		
		return findPendingTieups;
	}
	/*
	 * @Override public List<CollCompTieup> getAllTieCompaniesByStatus2() { // TODO
	 * Auto-generated method stub return
	 * tieUpRepository.findAllByStatustiedupcompanies(); }
	 */
	@Override
	public List<CollCompTieup> getCompanyTieUpList(Long companyId,String requested_by) {
		return tieUpRepository.getCompanyTieUpList(companyId,requested_by);
	}
	@Override
	public void saveTieUpReqCompany(Long companyId, Long collegeId, String collegeName) {
		
		User user = (User) session.getAttribute("user");
		System.out.println("College");
		CollCompTieup tieUpRequest = new CollCompTieup();
		tieUpRequest.setCompany_name(user.getUsername());
		tieUpRequest.setCollege_id(collegeId);
		tieUpRequest.setCompany_id(user.getInstituteId());
		tieUpRequest.setRequested_by("CP");
		tieUpRequest.setStatus("pending");
		
		tieUpRequest.setCollege_name(collegeName);
		tieUpRepository.save(tieUpRequest);
		
	}
	@Override
	public List<CollCompTieup> getCollegeReceivedReq(Long companyId, String requested_by) {
		// TODO Auto-generated method stub
		return tieUpRepository.findAllReceiveColllege(companyId,requested_by);
	}
	@Override
	public List<CollCompTieup> getCollegeTie(Long collegeId,String requested_by) {
		// TODO Auto-generated method stub
		return tieUpRepository.findTieCollege(collegeId,requested_by);
	}




	
}
