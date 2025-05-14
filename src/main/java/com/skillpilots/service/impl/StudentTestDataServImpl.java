package com.skillpilots.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.StudentOffer;
import com.skillpilots.model.StudentTestData;
import com.skillpilots.repository.StudentOfferRepository;
import com.skillpilots.repository.StudentTestDataRepository;
import com.skillpilots.service.StudentTestDataService;

@Service
public class StudentTestDataServImpl implements StudentTestDataService{
	private static final String UPLOAD_ = "src/main/resources/static/style/offer";






	@Autowired
	private StudentTestDataRepository studentTestDataRepository;
	@Autowired
	private StudentOfferRepository offerRepository;

	@Override
	public List<StudentTestData> getStudPenStatusTestDataByReqId(Long against_request_id) {
		
		return studentTestDataRepository.getStudPenStatusTestDataByReqId(against_request_id);
	}

	@Override
	public void saveStudTestData(StudentTestData studentTestData) {
		studentTestDataRepository.save(studentTestData);
	}

	@Override
	public StudentTestData getStudentTestData(Long test_data_id) {
		
		return studentTestDataRepository.findById(test_data_id).orElseThrow(()->  new RuntimeException("Test Data Not Found"));
	}

	@Override
	public List<Object[]> getTestHistory(Long studentId) {
		return studentTestDataRepository.findTestDataByStudentId(studentId);
	}

	@Override
	public StudentTestData getStudTestDataAgainstReq(Long test_data_id, Long student_id) {
	
		return studentTestDataRepository.getStudTestDataAgainstReq(test_data_id, student_id);
	}

	@Override
	public StudentOffer uploadOffer(Long studentId, Long companyId,MultipartFile file) throws IOException {
		StudentOffer studentOffer = new StudentOffer();
		 if (!file.isEmpty()) {
	            Path uploadPath = Paths.get(UPLOAD_).toAbsolutePath().normalize();
	            Files.createDirectories(uploadPath);
	            String fileName = file.getOriginalFilename();
	            Path filePath = uploadPath.resolve(fileName);
	            file.transferTo(filePath.toFile()); //save file to the server
	            studentOffer.setCompanyId(companyId);
	            studentOffer.setStudentId(studentId);
	            studentOffer.setFileName(fileName);
	            studentOffer.setStatus("A");
	        }
		
		return offerRepository.save(studentOffer);
	}

}
