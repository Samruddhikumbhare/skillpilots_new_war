package com.skillpilots.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.utility.ProjectConstants;

public interface CompAdvertismentRepo extends JpaRepository<CompAdvertisement, Long> {

	@Query(value = "SELECT DISTINCT a.location FROM advertisements_comp a", nativeQuery = true)
    List<String> getAllCities();
@Query(value="select * from advertisements_comp where company_id=:company_id order by id desc   ",nativeQuery = true)
List<CompAdvertisement> getAdvertisementByCompanyId(@Param("company_id")  Long company_id);


@Query(value = "SELECT ca.* FROM advertisements_comp ca WHERE :conditions AND (ca.expiration_date IS NULL OR ca.expiration_date >= :expiration_date) AND"
        + " ca.status = :status ORDER BY ca.id DESC" , nativeQuery=true)
List<CompAdvertisement> findByCustomConditionsAndExpirationDateAfterAndStatus(
        @Param("conditions") String conditions,
        @Param("expiration_date") Date expirationDate,
        @Param("status") String status
);


List<CompAdvertisement> findByLocationOrderByLocation(String location);
List<CompAdvertisement> findByLocationNotOrderByLocation(String location);

@Query(value="SELECT DISTINCT a.job_type FROM advertisements_comp a", nativeQuery = true)
List<String> getAllJobTypes();
@Query(value="SELECT DISTINCT a.working_type FROM advertisements_comp a", nativeQuery = true)
List<String> getWorkingTypes();
 
 
 List<CompAdvertisement> findByLocationAndStipendIsNotNullAndDurationGreaterThan(String location, int duration);

 List<CompAdvertisement> findByLocationAndStipendIsNullAndDurationLessThan(String location, int duration);
}
