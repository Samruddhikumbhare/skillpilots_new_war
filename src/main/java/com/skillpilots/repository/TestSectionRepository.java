package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.TestSection;

public interface TestSectionRepository extends JpaRepository<TestSection, Long> {

	@Query(value = "SELECT * FROM test_section WHERE test_id = :testId ", nativeQuery = true)
	List<TestSection> findAllByTest_Id(Long testId);
	
	@Query(value="select * from  test_section where test_id=:test_id ",nativeQuery = true)
	List<TestSection> findSectionByTestId(@Param("test_id")Long test_id);

	


}
