package com.skillpilots.repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.College;

public interface CollegeRepository extends JpaRepository<College, Long> {
    @Query(value = "SELECT * FROM College WHERE expiration_date >= :expirationDate OR expiration_date IS NULL", nativeQuery = true)
public    List<College> getAllColleges(@Param("expirationDate") Date expirationDate);
    
@Query(value ="SELECT * FROM college\r\n"	+ "ORDER BY college_id  DESC LIMIT 1",nativeQuery = true)
public College getLastCollege();

@Query(value = "SELECT * FROM college_data4 where type=0", nativeQuery = true)
public List<College> findAllTieCollege();
//@Query(value = "SELECT * FROM new.college_data4 where type=1", nativeQuery = true)
//public List<College> findAllByType();

@Query(value="select * from college_data4 where email_id=:emailId",nativeQuery = true)
public College getCollegeByEmail(@Param("emailId") String emailId) ;
@Query(value="select * from college_data4 where college_id=:college_id",nativeQuery = true)
public Optional<College> findByCollegeId(Long college_id);

@Query("Select c from College c where c.email_id=:email_id")
public College findByEmail(String email_id);
}

