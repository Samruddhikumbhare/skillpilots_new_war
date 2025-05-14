package com.skillpilots.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.query.Param;

import com.skillpilots.model.CompAdvertisement;
import com.skillpilots.model.Company;
import com.skillpilots.model.User;

public interface ComponyService {
 void saveCompony(Company compony);

void addAdvertisment(CompAdvertisement company);

List<CompAdvertisement> getAllCompAdvertisements();

void delete(Long advId);

List<Company> findAll();

List<String> getAllCities();

Company getCompanyById(String email);

Long findByEmail(String email);

List<Company> findAllByType();
List<Company> findAllByType1();
List<Company> findAllByType2();
List<Company> findAllByType3();

public List<CompAdvertisement> getAdvertisementByCompanyId(Long company_id);

Company getCompany(Long company_id);


String getCompanyName(Long company_id);

public List<String> getInternshipTech( Long company_id) ;

public List<String[]> getInternshipInst(Long company_id) ;


List<Object[]> getCompanyReport( String department,
        String technology,
        String status,
         Long institute,
        String duration,
         String dateType,
         Date from_date,
       Date to_date
       );

public List<String> getDepartments(Long company_id) ;

Optional<Company> findById(Long long1);

Company getCompanyById(Long id);


List<String> getAllJobTypes();
List<String> getAllWorkingTypes();
 
}
