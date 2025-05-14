package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.enumclass.QuestionLevel;
import com.skillpilots.model.UserTestResult;

public interface UserTestResultRepository extends JpaRepository<UserTestResult,Long> {

	/*
	 * // boolean existsByUserIdAndTestLevelAndPassed(Long user, TestLevel
	 * testLevel, boolean passed); boolean
	 * existsByUserIdAndTestIdAndQuestionLevelAndPassed(Long userId, Long testId,
	 * QuestionLevel questionLevel, boolean passed);
	 * 
	 * List<UserTestResult> findByUserId(Long studentId);
	 * 
	 * List<UserTestResult> findByUserIdAndTestId(Long studentId, Long id);
	 * 
	 * @Query("SELECT u.id, u.username, utp, t.testName " + "FROM User u " +
	 * "JOIN UserTestResult utp ON u.id = utp.userId " +
	 * "JOIN Test t ON utp.test.id = t.id " + "ORDER BY u.id ASC, utp.id DESC")
	 * List<Object[]> findUserTestAttempts();
	 */
  
	@Query(value = """
		    SELECT t.test_name, utr.question_level, utr.score
		    FROM user_test_result utr
		    JOIN test t ON utr.test_id = t.id
		    WHERE utr.user_id = :userId
		    ORDER BY utr.created_at DESC
		    LIMIT 3
		    """, nativeQuery = true)
		List<Object[]> findLatest3TestAttemptsByUser(@Param("userId") Long userId);

    
}
