package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.skillpilots.model.PackagesData;

public interface PackageRepository extends JpaRepository<PackagesData, Integer> {
	
	@Query(value="select * from packages_data where package_for=:package_for",nativeQuery = true)
	PackagesData getDefaultPkg(String package_for);

}
