package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.LiveProject;

public interface ProjectRepository  extends JpaRepository<LiveProject, Long>{
	
	List<LiveProject> findByUserId(Long userId);
	
    List<LiveProject> findTop1ByUserIdOrderByIdDesc(Long userId);


}
