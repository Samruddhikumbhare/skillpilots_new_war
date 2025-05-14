package com.skillpilots.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillpilots.model.StickyNotes;
import com.skillpilots.repository.StickyNotesRepo;
import com.skillpilots.service.StickyNotesService;

@Service
public class StickyNotesServiceImpl implements StickyNotesService {

	@Autowired
	private StickyNotesRepo stickyNotesRepo;
	
	@Override
	 public StickyNotes saveNote(String note, Long studentId)
	{
       StickyNotes stickyNote = new StickyNotes();
       stickyNote.setNotes(note);
       stickyNote.setDate(LocalDate.now());
       stickyNote.setStudentId(studentId);
       return stickyNotesRepo.save(stickyNote);
   }
	
	@Override
	public List<StickyNotes> getAllNotesByStudentId(Long studentId)
	{
		   return stickyNotesRepo.findAllByStudentIdOrderByIdDesc(studentId);
	}
	@Override
	public StickyNotes updateNotes(Long noteId, String notes)
	{
	    StickyNotes existingNote = stickyNotesRepo.findById(noteId).orElseThrow(() -> new RuntimeException("Note ID not found"));
	    existingNote.setNotes(notes);
	    existingNote.setDate(LocalDate.now());
	    return stickyNotesRepo.save(existingNote);
	}
	@Override
	public void deleteNotesById(Long noteId)
	{
		StickyNotes NotesId = stickyNotesRepo.findById(noteId).orElseThrow(()->new RuntimeException("Notes Id not found"));
		
		if(NotesId!=null)
		{
			stickyNotesRepo.deleteById(noteId);
		}
	}
	@Override
	public List<StickyNotes> getAllNotes() {
		return stickyNotesRepo.findAll();
	}

}
