package com.skillpilots.service;

import com.skillpilots.model.LiveProject;

public interface ProjectService {

public LiveProject getLastProjectByUserId(Long userId);
}
