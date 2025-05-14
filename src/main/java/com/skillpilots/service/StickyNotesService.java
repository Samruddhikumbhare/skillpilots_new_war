package com.skillpilots.service;

import java.util.List;

import com.skillpilots.model.StickyNotes;

public interface StickyNotesService {
	
	public StickyNotes saveNote(String note, Long studentId);
	
	 public List<StickyNotes> getAllNotesByStudentId(Long studentId);
	public StickyNotes updateNotes(Long noteId, String notes);
	public void deleteNotesById(Long noteId);
	public List<StickyNotes> getAllNotes();

}
