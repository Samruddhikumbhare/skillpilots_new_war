package com.skillpilots.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;
import com.skillpilots.repository.CompAdvertismentRepo;
import com.skillpilots.repository.ComponyRepository;
import com.skillpilots.service.ComponyService;

@Service
public class ComponyServiceImpl implements ComponyService {

	@Autowired
	private ComponyRepository compRepository;
	@Autowired
	private CompAdvertismentRepo advertismentRepo;
	
	public void saveCompony(Company compony) {
		compRepository.save(compony);
		
	}


	public void addAdvertisment(CompAdvertisement company) {
		compRepository.save(company);
		
	}


	@Override
	public List<CompAdvertisement> getAllCompAdvertisements() {
	
		return advertismentRepo.findAll();
	}


	@Override
	public void delete(Long advId) {

		advertismentRepo.deleteById(advId);
		
	}


	@Override
	public List<Company> findAll() {
	
		return compRepository.findAll();
	}


	@Override
	public List<String> getAllCities() {
		return advertismentRepo.getAllCities();
	}


	@Override
	public Company getCompanyById(String email) {
	
		return compRepository.getCompanyDetailsById(email);
	}


	@Override
	public List<Company> findAllByType() {
		
		return compRepository.findAllByType();
	}


	@Override
	public List<Company> findAllByType1() {
		
		return compRepository.findAllByType1();
	}


	@Override
	public List<Company> findAllByType2() {
	
		return compRepository.findAllByType2();
	}


	@Override
	public List<Company> findAllByType3() {
	
		return compRepository.findAllByType3();
	}


	@Override
	public List<CompAdvertisement> getAdvertisementByCompanyId(Long company_id) {
		return advertismentRepo.getAdvertisementByCompanyId(company_id);
	}


	@Override
	public Company getCompany(Long company_id) {
		
		return compRepository.findById(company_id).orElseThrow(()-> new RuntimeException("Company not found"+company_id));
	}


	@Override
	public String getCompanyName(Long company_id) {
		return compRepository.getCompanyName(company_id);
	}


	@Override
	public List<String> getInternshipTech(Long company_id) {
		return compRepository.getInternshipTech(company_id);
	}


	@Override
	public List<String[]> getInternshipInst(Long company_id) {
		return compRepository.getInternshipInst(company_id);
	}


	@Override
	public List<Object[]> getCompanyReport(String department, String technology, String status, Long institute,
			String duration, String dateType, Date from_date, Date to_date) {
		return compRepository.getCompanyReport(department, technology, status, institute, duration, dateType, from_date, to_date);
	}


	@Override
	public List<String> getDepartments(Long company_id) {
		return compRepository.getDepartments(company_id);
	}


	@Override
	public Long findByEmail(String email) {
		// TODO Auto-generated method stub
		return compRepository.findByEmailOptimized(email);
	}


	@Override
	public Optional<Company> findById(  Long cid) {
		// TODO Auto-generated method stub
		return compRepository.findById( cid);
	}


	@Override
	public Company getCompanyById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getAllJobTypes() {
		// TODO Auto-generated method stub
		return advertismentRepo.getAllJobTypes();
	}
	@Override
	public List<String> getAllWorkingTypes() {
		// TODO Auto-generated method stub
		return advertismentRepo.getWorkingTypes();
	}
	

}
