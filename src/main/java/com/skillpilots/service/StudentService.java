package com.skillpilots.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.skillpilots.Dto.StudentDetailsDTO;
import com.skillpilots.model.Student;
import com.skillpilots.model.StudentPast;

public interface StudentService {
public Student saveStudent(Student student);
public Student getStudentById(Long student_id) ;
public void saveStudent(StudentPast studentPast);
public List<Map<String, Object>> findAllByStudentId(Long studentId);
public void deleteStudentPastById(Long studPastId);
public void saveStudentById(Student student, Long a);
public Student getStudentByUserId(Long userId);
public List<Student> findAllByDept(Long deptId,Long college_id);
public List<Student> findAllByDept2(Long deptId,Long college_id);

List<Student> getStudentsByDept(Long dept,Long college_id);
public Student getSpecificStudent(Long student_id);
public List<StudentPast> getStudentPastEducation(Long student_id);
public List<Object[]> getStudentDetails(Long student_id);

List<StudentPast> findAllByStudentIds(Long studentId);
public List<Map<String, Object>> getAssessmentData(Long userId) ;

}
