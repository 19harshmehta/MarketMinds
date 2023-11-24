package com.arth.scheduler;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//@Component
public class EquityScheduler 
{
	@Scheduled(fixedRate = 1000 )
	public void demoSchedule() {
		System.out.println("hello world"+new Date());
	}
	
	@Scheduled(cron = " 0 36 16 * * * ")
	public void  demo() {
		System.out.println("hello");
	}
}
