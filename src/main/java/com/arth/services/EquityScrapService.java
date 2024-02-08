package com.arth.services;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.arth.dto.ResponseDtoList;
import com.arth.dto.Root;
import com.arth.entity.EquityEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.repository.EquityRepository;
import com.arth.repository.SchedulerLogRepository;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.annotation.PostConstruct;



@Service
public class EquityScrapService 
{
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	SchedulerLogRepository scheduleLogRepo;

	
	@PostConstruct
    public void initializeEquityData() {
        // Set today_open and today_close values for 'Adani Total Gas Ltd' (replace with your actual equity_name)
        String equityName = "Adani Total Gas Ltd";
        double openingValue =  111;

        // Check if today_open is not already set
        Optional<EquityEntity> existingEquity =  eqRepo.findByEquityName(equityName);
        if (existingEquity.isPresent() && existingEquity.get().getTodayOpen() == 0.0) {
            // Update today_open only if it is not already set
            String updateOpenQuery = "UPDATE equity SET today_open = ? WHERE equity_name = ?";
            jdbcTemplate.update(updateOpenQuery, openingValue, equityName);
        }

        // Perform any other initialization logic here
        scrapPriceForDb();
    }
	
	
	
	public Root scrapEquity(int lrr) {
		Root root = null;
		String apiUrl = "https://www.etmoney.com/stocks/list-of-stocks";

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setDoOutput(true);

			String param = "isAsync=true&lrr=" + lrr;

			try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
				outputStream.writeBytes(param);
				outputStream.flush();
			}

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close(); 

//				System.out.println(response.toString());
				ObjectMapper mapper = new ObjectMapper();
				root = mapper.readValue(response.toString(), Root.class);

//				System.out.println(root);
//				System.out.println(root.getResponseDTOList());
//				System.out.println(root.getResponseDTOList().get(0));
//				System.out.println(root.getResponseDTOList().get(0).getSn());
//				System.out.println(root.getLastUpdateTime().getValue());

			} else {
				System.out.println("GET request failed with response code: " + responseCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return root;
	}
	


	
	
	
	
	public void scrapPriceForDb() {
		ArrayList<EquityEntity> newEqty = new ArrayList<>();
		ArrayList<EquityEntity> updateEqty = new ArrayList<>();
		SchedulerEntity schedulerEntity = new SchedulerEntity();
		Date datetime = new Date();

		try {
			for (int i = 0; i <= 1950; i = i + 50) {
				Root root = scrapEquity(i);

				for (ResponseDtoList eqty : root.getResponseDTOList()) {
					String symbol = eqty.getSc();
					Optional<EquityEntity> opEq = null;
					try {
						opEq = eqRepo.findBySymbol(symbol);
					} catch (Exception e) {
						System.out.println(symbol);
						throw new Exception();
					}
					if (opEq.isEmpty()) {
						// new
						EquityEntity dbEq = new EquityEntity();
						dbEq.setActiveInd(1);
						dbEq.setBuysellInd(0);
						dbEq.setEquityName(eqty.getSn());
						dbEq.setHigh52(eqty.get_52h());
						dbEq.setLow52(eqty.get_52l());
						dbEq.setIndustryName(eqty.getIn());
						dbEq.setPrice(eqty.getCp());
						dbEq.setSeries("NA");
						dbEq.setSymbol(eqty.getSc());
						dbEq.setTodayClose(0d);
						dbEq.setTodayHigh(0d);
						dbEq.setTodayLow(0.0);
						dbEq.setTodayOpen(eqty.getCp());
						newEqty.add(dbEq);
					} else {
						// update
						EquityEntity dbEqty = opEq.get();
						dbEqty.setPrice(eqty.getCp());
						dbEqty.setHigh52(eqty.get_52h());
						dbEqty.setLow52(eqty.get_52l());
						dbEqty.setTodayOpen(eqty.getCp());						
						updateEqty.add(dbEqty);
					}

				}
				eqRepo.saveAll(newEqty);
				eqRepo.saveAll(updateEqty);
				schedulerEntity.setSchedulerName("Equity Scraapper");
				schedulerEntity.setStatusInd(0);
				schedulerEntity.setScheduleLogTime(datetime);
				scheduleLogRepo.save(schedulerEntity);

			}
		} catch (Exception e) {
			schedulerEntity.setSchedulerName("Equity Scraapper");
			schedulerEntity.setStatusInd(1);
			schedulerEntity.setScheduleLogTime(datetime);
			scheduleLogRepo.save(schedulerEntity);
			System.out.println("Error in scrap");
			e.printStackTrace();
		}
	}
	
	
	public void scrapForTechnical() 
	{

	}
	
	public void scrapDailyEndPrice()
	{
		
	}
	
}
