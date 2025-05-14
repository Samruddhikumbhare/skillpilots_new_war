package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long> {

}
