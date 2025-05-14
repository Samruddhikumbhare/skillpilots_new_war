package com.skillpilots.Dto;

import com.skillpilots.model.College;
import com.skillpilots.model.Internships;

public class InternshipWithStudentDTO {
    private Internships internship;
    private String studentName;
    private String collegeName;
    private String dept_name;

    public InternshipWithStudentDTO(Internships internship, String studentName, String collegeName , String dept_name) {
        this.internship = internship;
        this.studentName = studentName;
        this.collegeName = collegeName;
        this.dept_name = dept_name;
    }

    // Getters and setters
    public Internships getInternship() {
        return internship;
    }

    public void setInternship(Internships internship) {
        this.internship = internship;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
  
}

