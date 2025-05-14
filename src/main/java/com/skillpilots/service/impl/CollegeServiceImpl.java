package com.skillpilots.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.Address;
import com.skillpilots.model.CollDeptLink;
import com.skillpilots.model.College;
import com.skillpilots.model.CompDeptLink;
import com.skillpilots.repository.AddressRepository;
import com.skillpilots.repository.CollDeptRepository;
import com.skillpilots.repository.CollegeRepository;
import com.skillpilots.service.CollegeService;

import jakarta.transaction.Transactional;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeRepository collegeRepo;
    @Autowired
    private CollDeptRepository collDeptRepository;
    @Autowired
    private AddressRepository addressRepository;

   
    @Override
    public void deleteCollegeById(Long collegeId) {
        collegeRepo.deleteById(collegeId);
    }

    @Override
    public College getCollegeById(Long collegeId) {
        return collegeRepo.findById(collegeId).orElse(null);
    }

    @Override
    public List<College> getAllColleges() {
        return collegeRepo.findAll();
    }

	@Override
	public boolean saveCollege(College college) {
		collegeRepo.save(college);
		return false;
		
	}

	@Override
	public void updateCollege(College college) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<College> getAllTieColleges() {
		// TODO Auto-generated method stub
		return collegeRepo.findAllTieCollege();
	}

	@Override
	public List<College> findAllByType(short type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public College getCollegeByEmail(String emailId) {
		// TODO Auto-generated method stub
		return collegeRepo.getCollegeByEmail(emailId);
	}

	@Override
	public CollDeptLink getBalanceDataId(Long college_id, Long dept_id,Date expiration_date) {
		return collDeptRepository.getBalanceDataId(college_id, dept_id,expiration_date);
	}

	@Override
	public Optional<College> findById(int college_id) {
		// TODO Auto-generated method stub
		
		return collegeRepo.findByCollegeId((long) college_id);
	}


//	@Override
//	public List<College> getAllTieCollegesByType() {
//		// TODO Auto-generated method stub
//		return collegeRepo.findAllByType();
//	}








}
