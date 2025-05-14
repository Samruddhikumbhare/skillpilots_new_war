package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.Dto.InternshipDto;
import com.skillpilots.Dto.InternshipWithStudentDTO;
import com.skillpilots.model.CollegeInternalRequest;
import com.skillpilots.model.CompanyInternalRequest;
import com.skillpilots.model.ExternalRequest;
import com.skillpilots.model.Internships;
import com.skillpilots.model.StudentRequest;
import com.skillpilots.repository.CollegeInternalReqRepository;
import com.skillpilots.repository.CompanyInternalRequestRepository;
import com.skillpilots.repository.ExternalRequestRepository;
import com.skillpilots.repository.InternshipRepository;
import com.skillpilots.repository.StudentRepository;
import com.skillpilots.repository.StudentRequestRepository;
import com.skillpilots.service.InternshipService;
@Service
public  class InternshipServiceImpl implements InternshipService {

	@Autowired
	private InternshipRepository internshipRepository;
	@Autowired
	private CompanyInternalRequestRepository companyInternalRequestRepository;
	@Autowired
	private StudentRequestRepository studentRequestRepository;
	@Autowired
	private CollegeInternalReqRepository collegeInternalReqRepository;
	@Autowired
	private ExternalRequestRepository externalRequestRepository;
	@Override
	public void saveInternship(Internships internships) {
		internshipRepository.save(internships);
	}
	
	@Override
	public List<Internships> getUserDataListByUserId(Long userId) {
		return internshipRepository.findAllByStudentId(userId);
	}
	@Override
	public List<Internships> getOngoingInternshipStude(Long userId) {
		 return internshipRepository.findOngoingStudentInter(userId);
	
	
	}
	@Override
	public List<Internships> getCompletedInternshipStude(Long userId) {
	   return internshipRepository.findCompletedStudentIntern(userId);
	  
	 
}
	@Override
	public List<Internships> getCancelledInternshipStude(Long userId) {
	 return internshipRepository.findCancelledStudentIntern(userId);
	  
	 
	}






	@Override
	public List<Internships> getUserDataListByCompanyId(Long companyId) {
		return internshipRepository.findAllByCompanyId(companyId);
	}
	@Override
	public List<Internships> getUserDataListByCompanyId2(Long companyId) {
		return internshipRepository.findAllByCompanyId2(companyId);
	}
	@Override
	public List<Internships> getUserDataListByCompanyId3(Long companyId) {
		return internshipRepository.findAllByCompanyId3(companyId);
	}
	@Override
	public List<Internships> getUserDataListByCompanyId4(Long companyId) {
		return internshipRepository.findAllByCompanyId4(companyId);
	}

	@Override
	public boolean getInternshipStatusOfStudent(Long studentId) {
        List<String> validStatuses = Arrays.asList("ongoing", "P");
		 Long count = internshipRepository.countByStudentIdAndStatusInNative(studentId, validStatuses);
	        return count != null && count > 0;
    }

	@Override
	public List<Internships> getAllUserDataListByCompanyId(Long companyId) {
		return internshipRepository.findAllByCompanyId(companyId);
	}

	@Override
	public Internships getInternship(Long internship_id) {
		
		return internshipRepository.findById(internship_id).orElseThrow(()-> new RuntimeException("Internship Not found"+internship_id));
	}

	@Override
	public List<Object[]> getInternshipsOfCompany(Long companyId, String status,Long user_id) {
		
		return internshipRepository.getInternshipsOfCompany(companyId, status,user_id);
	}

	@Override
	public List<Internships> getCurrentInternshipsOfStudent(Long student_id) {
		return internshipRepository.getCurrentInternshipsOfStudent(student_id);
	}

	@Override
	public ArrayList<Internships> getPastOrPendingOrCancelledInternshipsOfStudent(Long student_id, String status) {
		return internshipRepository.getPastOrPendingOrCancelledInternshipsOfStudent(student_id, status);
	}


    public List<InternshipDto> getCertificate(Long studentId) {
    	List<InternshipDto> internships = new ArrayList<>();
		List<Object[]> results = internshipRepository.getCertificate(studentId);
		for (Object[] row : results) {
		    InternshipDto dto = new InternshipDto();
		    dto.setStudentId((Long) row[0]);  // Corrected casting to Long
	        dto.setCompanyId((Long) row[1]);  // Corrected casting to Long
	        dto.setCollegeId((Long) row[2]);   //
		    dto.setCompanyName((String) row[3]);
		    dto.setTechnology((String) row[4]);
		    dto.setStudentName((String) row[5]);
		    dto.setDuration((int) row[6]);
		    dto.setDateStarted((Date) row[7]);
		    dto.setDateCompleted((Date) row[8]);
		    dto.setDownloadUrl((String)row[9]);
		    dto.setInternshipid((Long) row[10]);
		    internships.add(dto);
		}
		return internships;
    }
    
    public List<InternshipDto> getAllStudent(Long id) {
        List<Object[]> results = internshipRepository.getAllStudent(id);
        List<InternshipDto> internships = new ArrayList<>();

        for (Object[] row : results) {
            InternshipDto dto = new InternshipDto();
            dto.setStudentId((Long) row[0]);
            dto.setCollegeId((Long) row[1]);
            dto.setCompanyName((String) row[2]); // Changed to company_name from company_id
          //  dto.setCollDept((String) row[3]);
            dto.setDuration((int) row[4]);
            dto.setDateStarted((Date) row[5]);
           // dto.setStatus((String) row[6]);
          //  dto.setInternshipId((Long) row[7]);
            dto.setTechnology((String) row[8]);
            dto.setStudentName((String) row[9]);
            dto.setDateCompleted((Date) row[10]);
            dto.setCompanyId((Long) row[11]);
            internships.add(dto);
        }

        return internships;
    
    }
	@Override
	public List<InternshipDto> getStudCertificate(Long id) {
		
		
	List<Object[]>results=	 internshipRepository.getStudCertificate(id);
	List<InternshipDto> internships =new ArrayList<>();
	for(Object[] row: results) {
        InternshipDto dto = new InternshipDto();
        dto.setStudentId((Long) row[0]); // Assuming student_id is Long
        dto.setCollegeId((Long) row[1]); // Assuming college_id is Long
      //  dto.setCollDept((String) row[2]); // Assuming coll_dept is String
        dto.setDuration((int) row[3]); // Assuming duration is String
        dto.setDateStarted((Date) row[4]); // Assuming date_started is Date
     //   dto.setStatus((String) row[5]); // Assuming status is String
     //   dto.setInternshipId((Long) row[6]); // Assuming internship_id is Long
        dto.setTechnology((String) row[7]); // Assuming technology is String
        dto.setStudentName((String) row[8]); // Assuming student_name is String
   //     dto.setUpdationDate((Date) row[9]); // Assuming updation_date is Date
        dto.setDateCompleted((Date) row[10]); // Assuming date_completed is Date
     //   dto.setReason((String) row[11]); // Assuming reason is String
        dto.setCompanyName((String) row [12]);
        dto.setCompanyId((Long) row [13]);
        internships.add(dto);
    }
    
    return internships;
	}

	@Override
	public List<InternshipDto> getCollStudentCertificate(Long college_id) {
		
		
		List<Object[]> results= internshipRepository.getCollStudentCertificate(college_id);
		List<InternshipDto> internships =new ArrayList<>();
		for(Object[] row: results) {
	        InternshipDto dto = new InternshipDto();
	        dto.setStudentId((Long) row[0]); // Assuming student_id is Long
	        dto.setCollegeId((Long) row[1]); // Assuming college_id is Long
	      //  dto.setCollDept((String) row[2]); // Assuming coll_dept is String
	        dto.setDuration((int) row[3]); // Assuming duration is String
	        dto.setDateStarted((Date) row[4]); // Assuming date_started is Date
	     //   dto.setStatus((String) row[5]); // Assuming status is String
	     //   dto.setInternshipId((Long) row[6]); // Assuming internship_id is Long
	        dto.setTechnology((String) row[7]); // Assuming technology is String
	        dto.setStudentName((String) row[8]); // Assuming student_name is String
	   //     dto.setUpdationDate((Date) row[9]); // Assuming updation_date is Date
	        dto.setDateCompleted((Date) row[10]); // Assuming date_completed is Date
	     //   dto.setReason((String) row[11]); // Assuming reason is String
	        dto.setCompanyName((String) row [12]);
	        dto.setCompanyId((Long) row [13]);
	        internships.add(dto);
	    }
		return internships;
	    
	    
	}

	@Override
	public List<InternshipDto> getStudentCertificate(Long college_id, Long dept_id) {
		List<Object[]> results = internshipRepository.getStudentCertificate(college_id, dept_id);
		
		List<InternshipDto> internships = new ArrayList<>();
		for (Object[] row : results) {
	        InternshipDto dto = new InternshipDto();
	        dto.setStudentId((Long) row[0]); 
	        dto.setCompanyId((Long) row[1]); 
	        dto.setCollegeId((Long) row[2]); 
	        dto.setTechnology((String) row[3]); 
	        dto.setStudentName((String) row[4]);
	        dto.setDuration((int) row[5]); 
	        dto.setDateStarted((Date) row[6]); 
	        dto.setDateCompleted((Date) row[7]);
	        dto.setCompanyName((String) row[8]); 
	        internships.add(dto);
	    }
	    
	    return internships;
	}

	@Override
	public List<Object[]> getInternshipsOfCompanies(Long companyId, String status) {
		// TODO Auto-generated method stub
		return internshipRepository.getInternshipsOfCompanies(companyId, status);
	}

	@Override
	public List<Object[]> getInternshipsOfCollege(Long college_id, String status) {
		return internshipRepository.getInternshipsOfCollege(college_id, status);
	}

	@Override
	public boolean getInternshipStatusOfStudents(Long studentId) {
		List<String> validStatuses = Arrays.asList("ongoing", "P");

List<Internships> internships = internshipRepository.findOngoingOrPendingInternshipsByStudentId(null, validStatuses);

        if (internships.isEmpty()) {
            List<CompanyInternalRequest> internalRequests = companyInternalRequestRepository
            		.findValidRequestsByUser(studentId, validStatuses, new Date());
            return !internalRequests.isEmpty();
        }
        return true;
    }

	@Override
	public boolean isStudentAlreadyApplied(Long studentId, Long companyId) {
		 List<StudentRequest> studentRequests = studentRequestRepository.findStudentRequests(studentId, companyId);
		        

		        if (!studentRequests.isEmpty()) {
		            System.out.println("found in direct apply.");
		            return true;
		        }

		        // Check in CollegeInternalRequest
		        List<CollegeInternalRequest> collegeInternalRequests = collegeInternalReqRepository.findCollegeInternalRequests(companyId, "%" + String.valueOf(studentId)+ "%", new Date());
		          

		        if (!collegeInternalRequests.isEmpty()) {
		            System.out.println("found in internal request.");
		            return true;
		        }

		        // Check in ExternalRequest
		        List<ExternalRequest> externalRequests = externalRequestRepository.findExternalRequests(String.valueOf(companyId), "%" + studentId + "%", new Date());

		        if (!externalRequests.isEmpty()) {
		            System.out.println("found in external request.");
		            return true;
		        }

		        return false;
		    }

	@Override
	 public List<InternshipWithStudentDTO> findByTeamsAndStatus(String department,String company_name ,Long coll_dept, String status, String technology, Integer duration, Long college_id) {
	       
		
		
		
		
		
		 List<Object[]> results = internshipRepository.findByCompDeptId(department,company_name, coll_dept,status, technology, duration, college_id);
	        List<InternshipWithStudentDTO> dtos = new ArrayList<>();
	        for (Object[] result : results) {
	            Internships internship = (Internships) result[0];
	            String studentName = (String) result[1];
	            String dept_name = (String) result[3];
	            String collegeName = internshipRepository.findCollegeNameById(college_id);
	            dtos.add(new InternshipWithStudentDTO(internship, studentName, collegeName, dept_name));
	        }
	        return dtos;
	    }
	
	@Override
	 public List<InternshipWithStudentDTO> findByTeamsAndStatus2(Long company_id,String department,String company_name ,Long coll_dept, String status, String technology, Integer duration, Long college_id) {
	     List<Object[]> results = internshipRepository.findByCompDeptId2(company_id,department,company_name,coll_dept, status, technology, duration, college_id);
	     List<InternshipWithStudentDTO> dtos = new ArrayList<>();
	     for (Object[] result : results) {
	         Internships internship = (Internships) result[0];
	         String studentName = (String) result[1];
	         String collegeName = (String) result[2];
	         String dept_name = (String) result[3];
	         dtos.add(new InternshipWithStudentDTO(internship, studentName, collegeName, dept_name));
	     }
	     return dtos;
	 }
	
	 @Override
	 public List<InternshipWithStudentDTO> findByTeamsAndStatus3(Long college_id,String department,String company_name ,Long coll_dept, String status, String technology, Integer duration, Long collegeId) {
		 List<Object[]> results = internshipRepository.findByCompDeptId3(college_id, department, company_name, coll_dept, status, technology, duration);
			
		 List<InternshipWithStudentDTO> dtos = new ArrayList<>();
	     for (Object[] result : results) {
	         Internships internship = (Internships) result[0];
	         String studentName = (String) result[1];
	         String collegeName = (String) result[2];
	         String dept_name = (String) result[3];
	         dtos.add(new InternshipWithStudentDTO(internship, studentName, collegeName, dept_name));
	     }
	     return dtos;
	 }
	@Override
	public List<Internships> getCompanies(Long id) {
		return internshipRepository.getCompanies(id);
	}

	@Override
	public List<StudentRequest> getRecordByid(Long id) {
		// TODO Auto-generated method stub
		return studentRequestRepository.findByStudentId(id);
	}
	
	
	@Override
	 public List<InternshipWithStudentDTO> findByCollegeId(Long college_id) {
	     List<Object[]> results = internshipRepository.findByCompDeptId22(college_id);
	     List<InternshipWithStudentDTO> dtos = new ArrayList<>();
	     for (Object[] result : results) {
	         Internships internship = (Internships) result[0];
	         String studentName = (String) result[1];
	         String collegeName = (String) result[2];
	         String dept_name = (String) result[3];
	         dtos.add(new InternshipWithStudentDTO(internship, studentName, collegeName, dept_name));
	     }
	     return dtos;
	 }

}
