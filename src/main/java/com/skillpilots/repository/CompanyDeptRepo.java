package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.skillpilots.utility.ProjectConstants;
@Repository
public class CompanyDeptRepo {
    private final JdbcTemplate jdbcTemplate;

	@Autowired
    public CompanyDeptRepo(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


	@SuppressWarnings("deprecation")
    public List<Object[]> getCompanyReport(String department, String technology, String status, Long institute, String duration) {
        String sql = "SELECT intr.internship_id, intr.advertisement_id, intr.against_int_req_id, "
                + "intr.comp_dept_id, intr.creation_date, intr.updation_date, intr.student_id, intr.college_id, "
                + "intr.coll_dept, intr.company_id, intr.duration, intr.status AS sstat, intr.technology, "
                + "intr.date_started, intr.date_completed, cmdl.dept_name, std.student_id AS stud_id, "
                + "std.student_name, clg.college_id AS clg_id, clg.college_name "
                + "FROM internships2 intr "
                + "LEFT JOIN college_data4 clg ON intr.college_id = clg.college_id "
                + "LEFT JOIN comp_dept_link cmdl ON cmdl.company_id = intr.company_id AND cmdl.dept_name = intr.comp_dept_id "
                + "LEFT JOIN student_data std ON intr.student_id = std.student_id "
                + "WHERE cmdl.status IN ('A', 'C') "
                + "AND cmdl.dept_name = ? "
                + "AND intr.technology = ? "
                + "AND intr.status = ? "
                + "AND intr.college_id = ? "
                + "AND intr.duration = ?";

        return jdbcTemplate.query(sql, new Object[]{
                department,
                technology,
                status,
                institute,
                duration
        }, (resultSet, rowNum) -> {
            Object[] result = new Object[resultSet.getMetaData().getColumnCount()];
            for (int i = 0; i < result.length; i++) {
                result[i] = resultSet.getObject(i + 1);
            }
            return result;
        });
    }
}
