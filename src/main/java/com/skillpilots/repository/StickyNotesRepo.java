package com.skillpilots.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skillpilots.model.StickyNotes;

public interface StickyNotesRepo extends JpaRepository<StickyNotes, Long> {
    List<StickyNotes> findAllByStudentIdOrderByIdDesc(Long studentId);

}
