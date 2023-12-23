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
import org.springframework.stereotype.Service;

import com.arth.dto.ResponseDtoList;
import com.arth.dto.Root;
import com.arth.entity.EquityEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.repository.EquityRepository;
import com.arth.repository.SchedulerLogRepository;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class EquityScrapService 
{
	@Autowired
	EquityRepository eqRepo;
	
	@Autowired
	SchedulerLogRepository scheduleLogRepo;

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

	// this is main method wich invoke above scrap method
	public void scrapPriceForDb() {
		ArrayList<EquityEntity> newEqty = new ArrayList<>();
		ArrayList<EquityEntity> updateEqty = new ArrayList<>();
		SchedulerEntity schedulerEntity = new SchedulerEntity();
		Date datetime = new Date();

		try {
			for (int i = 50; i <= 1950; i = i + 50) {
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
						dbEq.setTodayOpen(0.0);
						newEqty.add(dbEq);
					} else {
						// update
						EquityEntity dbEqty = opEq.get();
						dbEqty.setPrice(eqty.getCp());
						dbEqty.setHigh52(eqty.get_52h());
						dbEqty.setLow52(eqty.get_52l());
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
