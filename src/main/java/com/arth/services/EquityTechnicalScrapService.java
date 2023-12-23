package com.arth.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.EqTechnicalEntity;
import com.arth.entity.EquityEntity;
import com.arth.entity.SchedulerEntity;
import com.arth.repository.EqTechRepository;
import com.arth.repository.EquityRepository;
import com.arth.repository.SchedulerLogRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class EquityTechnicalScrapService {
    @Autowired
    EquityRepository eqRepo;

    @Autowired
    EqTechRepository eqTechRepo;
    
    @Autowired
    SchedulerLogRepository scheduleLogRepo;

    private final String apiUrl = "https://openweb-analytical.dhan.co/analytical/getTechnicalIndicator";

    public void scrapTechnicalIndicators() {
    	
    	SchedulerEntity schedulerEntity = new SchedulerEntity();
		Date datetime = new Date();
        try {
            List<EquityEntity> equities = eqRepo.findAll();

            for (EquityEntity equity : equities) {
                String symbol = equity.getSymbol();
                String jsonData = prepareJsonData(symbol);

                // Create URL object
                URL url = new URL(apiUrl);

                // Open connection
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                // Set the request method to POST
                connection.setRequestMethod("POST");

                // Enable input/output streams
                connection.setDoOutput(true);

                // Set request headers
                connection.setRequestProperty("Content-Type", "application/json");

                // Scrap logic
                try (OutputStream os = connection.getOutputStream()) {
                    byte[] input = jsonData.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // Get response code
                int responseCode = connection.getResponseCode();
                System.out.println("Response Code: " + responseCode);
                if (connection.getResponseCode() != 200) {
                    saveTechnicalIndicatorsToDatabase(equity.getEquityId(), "RSI (14)", "NA", 0.0f);
                    saveTechnicalIndicatorsToDatabase(equity.getEquityId(), "MACD (12,26)", "NA", 0.0f);
                    continue;
                }

                // Read response
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }

                    // Parse JSON response
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonNode = objectMapper.readTree(response.toString());

                    // Extract RSI and MACD data
                    JsonNode dataNode = jsonNode.at("/data");
                    if (dataNode.isArray() && dataNode.size() > 0) {
                        JsonNode indicatorNode = dataNode.get(1).at("/Indicator");

                        for (JsonNode node : indicatorNode) {
                            String indicatorName = node.get("Indicator").asText();
                            if (indicatorName.equals("RSI (14)") || indicatorName.equals("MACD (12,26)")) {
                                String action = node.get("Action").asText();
                                double value = node.get("Value").asDouble();
                                System.out.println("Symbol: " + symbol + " Indicator: " + indicatorName + ", Action: " + action + ", Value: " + value);

                                saveTechnicalIndicatorsToDatabase(equity.getEquityId(), indicatorName, action, (float) value);
                            }
                        }
                    }
                }
            }
            schedulerEntity.setSchedulerName("Technical Indicator Scraapper");
			schedulerEntity.setStatusInd(0);
			schedulerEntity.setScheduleLogTime(datetime);
			scheduleLogRepo.save(schedulerEntity);
			System.out.println("In Technical");
        } catch (Exception e) {
            e.printStackTrace();
            schedulerEntity.setSchedulerName("Technical Indicator Scraapper");
			schedulerEntity.setStatusInd(1);
			schedulerEntity.setScheduleLogTime(datetime);
			scheduleLogRepo.save(schedulerEntity);
			System.out.println("Error in Technical");
        }
        //
    }

    private String prepareJsonData(String symbol) {
        return "{\"entity_id\":\"OpenWeb\",\"source\":\"O\",\"token_id\":\"\",\"iv\":\"\",\"data\":{\"exchange\":\"NSE\",\"segment\":\"E\",\"security_id\":21238,\"isin\":\"INE949L01017\",\"symbol\":\"" + symbol + "\",\"minute\":\"D\"}}";
    }

    private void saveTechnicalIndicatorsToDatabase(Integer eqId, String indicatorName, String action, Float value) {
        EqTechnicalEntity existingTechnical = eqTechRepo.findByEqId(eqId);

        if (existingTechnical != null) {
            // Update existing entry
            if (indicatorName.equals("RSI (14)")) {
                existingTechnical.setRsi(value);
            } else if (indicatorName.equals("MACD (12,26)")) {
                existingTechnical.setMacd(value);
            }
        } else {
            // Create a new entry
            EqTechnicalEntity newTechnical = new EqTechnicalEntity();
            newTechnical.setEqId(eqId);
            newTechnical.setRsi(indicatorName.equals("RSI (14)") ? value : null);
            newTechnical.setMacd(indicatorName.equals("MACD (12,26)") ? value : null);
            eqTechRepo.save(newTechnical);
        }
    }
}
