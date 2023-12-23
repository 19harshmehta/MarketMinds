package com.arth.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.AlertEntity;
import com.arth.entity.EquityEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.entity.UserEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.EquityRepository;
import com.arth.repository.SchedulerLogRepository;
import com.arth.repository.UserRepository;

@Service
public class AlertService 
{
	@Autowired
	private AlertRepository alertRepo;
	
	@Autowired
	private EquityRepository equityRepo;
	
	@Autowired
	private MailerService mailService;

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private SchedulerLogRepository scheduleLogRepo;
	
	public void checkAndSendAlert()
	{
		List<AlertEntity> alerts = alertRepo.findByActiveInd(1);
		SchedulerEntity schedulerEntity = new SchedulerEntity();
		Date datetime = new Date();
		if(alerts != null)
		{	
			for (AlertEntity alert : alerts) {
	            EquityEntity equity = equityRepo.findById(alert.getEquityId()).orElse(null);
	            if (equity != null && equity.getPrice() > alert.getTargetPrice()) {
	                UserEntity user = userRepo.findById(alert.getUserId()).orElse(null);
	                if (user != null) {
	                	System.out.println("in if mail sent");
	                    mailService.sendAlertEmail(user, alert);
	                    alert.setActiveInd(0);
	                    alertRepo.save(alert);
	                    
	                }else {
	                	schedulerEntity.setSchedulerName("TargetHit Mail Scraapper");
	        			schedulerEntity.setStatusInd(1);
	        			schedulerEntity.setScheduleLogTime(datetime);
	        			scheduleLogRepo.save(schedulerEntity);
	        			System.out.println("Error schedul -> alert");
	                	System.out.println("no email");
	                }
	            }
	        }
			schedulerEntity.setSchedulerName("TargetHit Mail Scraapper");
			schedulerEntity.setStatusInd(0);
			schedulerEntity.setScheduleLogTime(datetime);
			scheduleLogRepo.save(schedulerEntity);
		}
	}
}
