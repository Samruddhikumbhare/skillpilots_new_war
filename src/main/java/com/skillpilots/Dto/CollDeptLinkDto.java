package com.skillpilots.Dto;

import java.sql.Date;

import lombok.Data;
import lombok.ToString;
@Data
@ToString
public class CollDeptLinkDto {
	
	private Long collDeptLinkId;
    private Long deptId;
    private Date expirationDate;
    private Date updationDate;
    private Long hodId;
    private String hodName;
    private Long iiiId;
    private String iiiName;
    private Long balanceDataId;
    private Long commonId;
    private Date creationDate;
    private Long collegeId;
    private Date effectiveDate;
    private Long headId;
    private Long iiiDeptCoId;
    private String status;
    private String deptName;

}
