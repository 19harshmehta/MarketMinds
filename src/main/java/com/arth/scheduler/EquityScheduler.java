package com.arth.scheduler;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.arth.entity.EquityEntity;
import com.arth.entity.EquityPriceDataEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.repository.AlertRepository;
import com.arth.repository.EquityPriceDataRepository;
import com.arth.repository.EquityRepository;
import com.arth.services.AlertService;
import com.arth.services.EquityScrapService;
import com.arth.services.EquityTechnicalScrapService;

@Component
public class EquityScheduler 
{
	
	@Autowired
	AlertService alertService;
	
	@Autowired
	AlertRepository alertRepo;
	
	@Autowired
	EquityScrapService eqScrapService;
	
	@Autowired
	EquityTechnicalScrapService eqTechnical;
	
	@Autowired
    EquityPriceDataRepository eqPriceRepo;
	
	@Autowired
    EquityRepository equityRepo;
	
	
	
//	@Scheduled(fixedRate = 1000 )
//	public void demoSchedule() {
//		System.out.println("hello world"+new Date());
//	}
	
//	@Scheduled(cron = "0 */1 * * * *")
	public void  demo(SchedulerEntity schedulerEntity) {
		System.out.println("hello");
	}
	
	@Scheduled(cron = "0 */1 * * * *")
	public void scrapEquityScheduler() 
	{
		
		
		try 
		{
			Runnable r = () ->{
				eqScrapService.scrapPriceForDb();
			};
			Thread t = new Thread(r);
			t.start();
			
			System.out.println("in scrap");
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	@Scheduled(cron = "0 */3 * * * *")
	public void sendAlertEmail()
	{
		
		try 
		{
			Runnable r = () ->{
				alertService.checkAndSendAlert();	
			};
			Thread t = new Thread(r);
			t.start();
			
			System.out.println("schedul -> alert");
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}
	
	@Scheduled(cron = "0 */30 * * * *")
	public void scrapTechnical()
	{
		LocalDateTime now = LocalDateTime.now();
		
		if(now.getHour() >= 16 ) {
			System.out.println("Overtime");
			return;
		}
		
		try 
		{
			Runnable r = () ->{
				eqTechnical.scrapTechnicalIndicators();
			};
			Thread t = new Thread(r);
			t.start();
			
		}catch(Exception e) 
		{
			
			e.printStackTrace();
		}
	}
	
	
	@Scheduled(cron = "0 0 16 * * *")
	public void scrapEndPriceScheduler() 
	{
		try 
		{
			for(EquityEntity equity :equityRepo.findAll()) {
//		        Eq(EquityEntity) equityRepo.findByEquityName(equityName).get(0);
		        if (equity != null) {
		            EquityPriceDataEntity equityPrice = new EquityPriceDataEntity();
		            equityPrice.setEquity(equity);
		            equityPrice.setDate(new Date());
		            equityPrice.setClosingPrice(equity.getPrice());
		            
		            eqPriceRepo.save(equityPrice);
		            
		            
		        } else {
		            // Handle case where equity with given name is not found
		        }
		    }
			System.out.println("End Of Day Price Scrapped");
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
}
