package com.skillpilots.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.skillpilots.model.StudentOffer;
import com.skillpilots.model.StudentTestData;

public interface StudentTestDataService {
	
	List<StudentTestData> getStudPenStatusTestDataByReqId(Long against_request_id);

	void saveStudTestData(StudentTestData studentTestData);

	StudentTestData getStudentTestData(Long test_data_id);

	List<Object[]> getTestHistory(Long id);

	StudentTestData getStudTestDataAgainstReq(Long against_request_id, Long student_id);
	StudentOffer uploadOffer(Long studentId,Long companyId,MultipartFile file) throws IOException;







}
