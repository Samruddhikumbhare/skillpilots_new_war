package com.skillpilots.model;


import java.util.Date;
import java.util.List;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name = "assessment_test")
public class AssessmentTest {

	@Id
	@Column(name="test_id")
	public Long tesId;
	public String testName;
	public String userId;
	public int total_mark;
	public int total_que;
	public int time;
	public int cut_off;
	public int mark_per_que;
	public String status;
	public Date from_date;
	public Date to_date;
	public Date creation_date;
	public Date updation_date;
	public Date expiration_date;
	@OneToMany(mappedBy = "assessmentTest", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    private List<Questions> questions;

	
	 @Override
	    public String toString() {
	        StringBuilder sb = new StringBuilder();
	        sb.append("AssessmentTest [tesId=").append(tesId)
	          .append(", testName=").append(testName)
	          .append(", userId=").append(userId)
	          .append(", total_mark=").append(total_mark)
	          .append(", total_que=").append(total_que)
	          .append(", time=").append(time)
	          .append(", cut_off=").append(cut_off)
	          .append(", mark_per_que=").append(mark_per_que)
	          .append(", status=").append(status)
	          .append(", from_date=").append(from_date)
	          .append(", to_date=").append(to_date)
	          .append(", creation_date=").append(creation_date)
	          .append(", updation_date=").append(updation_date)
	          .append(", expiration_date=").append(expiration_date)
	          .append(", questions.size=").append(questions != null ? questions.size() : "null")
	          .append("]");
	        return sb.toString();
	    }
	
}
