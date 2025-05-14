package com.skillpilots.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.StudentOffer;

public interface StudentOfferRepository extends JpaRepository<StudentOffer, Long> {

}
