package com.skillpilots.service;

import com.skillpilots.model.PackagesData;

public interface PackageDataService {

	
	PackagesData getDefaultPkg(String package_for);

	PackagesData getPackageData(int package_id);
}
