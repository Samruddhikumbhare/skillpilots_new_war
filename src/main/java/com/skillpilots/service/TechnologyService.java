package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.Technologies;

public interface TechnologyService {
	List<Technologies> getAllTechnology();

	List<String> getTechnologyNameList();
	List<String> getTechList();

}
