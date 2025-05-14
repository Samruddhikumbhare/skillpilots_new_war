package com.skillpilots.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.PackagesData;
import com.skillpilots.repository.PackageRepository;
import com.skillpilots.service.PackageDataService;
@Service
public class PackageDataServiceImpl  implements PackageDataService{
	@Autowired
	private PackageRepository packageRepository;
	
	@Override
	public PackagesData getDefaultPkg(String package_for) {
		return packageRepository.getDefaultPkg(package_for);
	}

	@Override
	public PackagesData getPackageData(int package_id) {
		// TODO Auto-generated method stub
		return packageRepository.findById(package_id).orElseThrow(()-> new RuntimeException("Package Not found"+package_id));
	}

}
