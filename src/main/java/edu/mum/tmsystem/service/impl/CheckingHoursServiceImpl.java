package edu.mum.tmsystem.service.impl;

import java.util.Date;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.tmsystem.domain.AvailableEntry;
import edu.mum.tmsystem.domain.CheckingHours;
import edu.mum.tmsystem.domain.Student;
import edu.mum.tmsystem.domain.TMHistory;
import edu.mum.tmsystem.enums.TMStatusType;
import edu.mum.tmsystem.repository.ICheckingHoursRepository;
import edu.mum.tmsystem.service.IAvailableEntryService;
import edu.mum.tmsystem.service.ICheckingHoursService;
import edu.mum.tmsystem.service.IStudentService;
import edu.mum.tmsystem.service.ITMHistoryService;
import edu.mum.tmsystem.util.DateUtil;
import edu.mum.tmsystem.util.SessionManager;

@Service
@Transactional
public class CheckingHoursServiceImpl implements ICheckingHoursService{
	
	@Autowired
	ICheckingHoursRepository checkingHoursRepository;
	
	@Autowired
	IStudentService studentService;
	
	@Autowired
	ITMHistoryService tmHistoryService;
	
	@Autowired
	IAvailableEntryService availableEntryService;

	@Override
	public CheckingHours signUpForGivenCheckingHour(Integer checkingHourId) {
		CheckingHours checkingHours = checkingHoursRepository.findOne(checkingHourId);
		Student student = studentService.getStudentByUserId(SessionManager.getUserID());
		checkingHours.setSignUpBy(student);
		
		TMHistory tmHistory = new TMHistory();
		tmHistory.setCheckingHours(checkingHours);
		tmHistory.setCheckingType(checkingHours.getAvailableEntry().getCheckingType());
		tmHistory.setSignUpDate(DateUtil.getCurrentDate());
		tmHistory.setRoom(checkingHours.getAvailableEntry().getRoom());
		tmHistory.setStatus(TMStatusType.PENDING);
		tmHistory.setStudent(student);
		
		tmHistoryService.saveHistory(tmHistory);	
		
		availableEntryService.updateNumberOfSeats(checkingHours.getAvailableEntry().getId());
		
		return checkingHoursRepository.save(checkingHours);
	}

}