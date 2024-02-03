package com.arth.services;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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

//    private final String apiUrl = "https://ow-static-scanx.dhan.co/staticscanx/indicator";
//
//    public void scrapTechnicalIndicators() {
//    	
//    	SchedulerEntity schedulerEntity = new SchedulerEntity();
//		Date datetime = new Date();
//        try {
//            List<EquityEntity> equities = eqRepo.findAll();
//
//            for (EquityEntity equity : equities) {
//                String symbol = equity.getSymbol();
//                String jsonData = prepareJsonData(symbol);
//
//                // Create URL object
//                URL url = new URL(apiUrl);
//
//                // Open connection
//                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//
//                // Set the request method to POST
//                connection.setRequestMethod("POST");
//
//                // Enable input/output streams
//                connection.setDoOutput(true);
//
//                // Set request headers
//                connection.setRequestProperty("Content-Type", "application/json");
//
//                // Scrap logic
//                try (OutputStream os = connection.getOutputStream()) {
//                    byte[] input = jsonData.getBytes("utf-8");
//                    os.write(input, 0, input.length);
//                }
//
//                // Get response code
//                int responseCode = connection.getResponseCode();
//                System.out.println("Response Code: " + responseCode);
//                if (connection.getResponseCode() != 200) {
//                    saveTechnicalIndicatorsToDatabase(equity.getEquityId(), "RSI (14)", "NA", 0.0f);
//                    saveTechnicalIndicatorsToDatabase(equity.getEquityId(), "MACD (12,26)", "NA", 0.0f);
//                    continue;
//                }
//
//                // Read response
//                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
//                    StringBuilder response = new StringBuilder();
//                    String responseLine;
//                    while ((responseLine = br.readLine()) != null) {
//                        response.append(responseLine.trim());
//                    }
//
//                    // Parse JSON response
//                    ObjectMapper objectMapper = new ObjectMapper();
//                    JsonNode jsonNode = objectMapper.readTree(response.toString());
//
//                    // Extract RSI and MACD data
//                    JsonNode dataNode = jsonNode.at("/data");
//                    if (dataNode.isArray() && dataNode.size() > 0) {
//                        JsonNode indicatorNode = dataNode.get(1).at("/Indicator");
//
//                        for (JsonNode node : indicatorNode) {
//                            String indicatorName = node.get("Indicator").asText();
//                            if (indicatorName.equals("RSI (14)") || indicatorName.equals("MACD (12,26)")) {
//                                String action = node.get("Indicator").asText();
//                                double value = node.get("Value").asDouble();
//                                System.out.println("Symbol: " + symbol + " Indicator: " + indicatorName + ", Action: " + action + ", Value: " + value);
//
//                                saveTechnicalIndicatorsToDatabase(equity.getEquityId(), indicatorName, action, (float) value);
//                            }
//                        }
//                    }
//                }
//            }
//            schedulerEntity.setSchedulerName("Technical Indicator Scraapper");
//			schedulerEntity.setStatusInd(0);
//			schedulerEntity.setScheduleLogTime(datetime);
//			scheduleLogRepo.save(schedulerEntity);
//			System.out.println("In Technical");
//        } catch (Exception e) {
//            e.printStackTrace();
//            schedulerEntity.setSchedulerName("Technical Indicator Scraapper");
//			schedulerEntity.setStatusInd(1);
//			schedulerEntity.setScheduleLogTime(datetime);
//			scheduleLogRepo.save(schedulerEntity);
//			System.out.println("Error in Technical");
//        }
//        //
//    }
//
//    private String prepareJsonData(String symbol) {
////        return "{\"entity_id\":\"OpenWeb\",\"source\":\"O\",\"token_id\":\"\",\"iv\":\"\",\"data\":{\"exchange\":\"NSE\",\"segment\":\"E\",\"security_id\":21238,\"isin\":\"INE949L01017\",\"symbol\":\"" + symbol + "\",\"minute\":\"D\"}}";
//    	return "{\"exchange\":\"NSE\",\"segment\":\"E\",\"security_id\":21238,\"isin\":\"INE949L01017\",\"symbol\":\""+symbol+"\",\"minute\":\"D\"}}";
//
//    }
//
//    private void saveTechnicalIndicatorsToDatabase(Integer eqId, String indicatorName, String action, Float value) {
//        EqTechnicalEntity existingTechnical = eqTechRepo.findByEqId(eqId);
//
//        if (existingTechnical != null) {
//            // Update existing entry
//            if (indicatorName.equals("RSI (14)")) {
//                existingTechnical.setRsi(value);
//            } else if (indicatorName.equals("MACD (12,26)")) {
//                existingTechnical.setMacd(value);
//            }
//        } else {
//            // Create a new entry
//            EqTechnicalEntity newTechnical = new EqTechnicalEntity();
//            newTechnical.setEqId(eqId);
//            newTechnical.setRsi(indicatorName.equals("RSI (14)") ? value : null);
//            newTechnical.setMacd(indicatorName.equals("MACD (12,26)") ? value : null);
//            eqTechRepo.save(newTechnical);
//        }
//    }
    
    public void getSids() {
    	String apiUrl = "https://ow-static-scanx.dhan.co/staticscanx/snimap";
//        for(int i=1;i<=50;i++) {
        // Replace with your actual JSON parameters
    	String jsonParams = "{\r\n"
        		+ "    \r\n"
        		+ "    \"Data\": {\r\n"
        		+ "        \"Seg\": 1,\r\n"
        		+ "        \"SecIdxCode\":1\r\n"
        		+ "    \r\n"
        		+ "}\r\n"
        		+ "}";
        try {
            // Create URL object
            URL url = new URL(apiUrl);
            
            // Open connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            
            // Set request method
            connection.setRequestMethod("POST");
            
            // Enable input/output streams
            connection.setDoOutput(true);
            
            // Set request headers
            connection.setRequestProperty("Content-Type", "application/json");
            
            // Write JSON parameters to the request body
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonParams.getBytes("utf-8");
                os.write(input, 0, input.length);
            }
            
            // Get response code
            int responseCode = connection.getResponseCode();
            
            // Read response
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println("Response: " + response.toString());
                    String stringResponce = response.toString();
                    
                    try {
                        // Create ObjectMapper instance
                        ObjectMapper objectMapper = new ObjectMapper();

                        // Parse the string response into a JsonNode
                        JsonNode jsonNode = objectMapper.readTree(stringResponce);

                     // Extract data array from the JSON
                        JsonNode dataArray = jsonNode.get("data");

                        // Iterate through each element in the data array
                        for (JsonNode data : dataArray) {
                            // Extract necessary information
                            String symbol = data.get("sym").asText();
                            int sid = data.get("sid").asInt();

                            // Check if the symbol is present in the EquityEntity table
                            try {
                            Optional<EquityEntity> opt = eqRepo.findBySymbol(symbol);
//                            if(opt!=null) 
//                            {
	                            EquityEntity existingEntity = opt.get();
	
	                            if (existingEntity != null) {
	                                // Update the sid in the existing entity
	                                existingEntity.setSid(sid);
	
	                                // Save the updated entity back to the EquityEntity table
	                                eqRepo.save(existingEntity);
	
	                                System.out.println("Updated EquityEntity for symbol: " + symbol);
	                            } else {
	                                System.out.println("Symbol not found in EquityEntity: " + symbol);
	                            }
                            }catch (Exception e) {
								e.printStackTrace();
							}
                        }
                        
                        
                        
                        
                        
                        // Now you can work with the JsonNode as needed
//                        System.out.println("Parsed JSON:\n" + jsonNode.toPrettyString());
                        System.out.println("Parsed JSON Sucess:\n");
                        

                    } catch (Exception e) {
                        e.printStackTrace();
                    }   
                }
            } else {
                System.out.println("Error: " + responseCode);
            }

            // Close connection
            connection.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }//}
    
    
    public void scrapTechnical() 
    {
    	String apiUrl = "https://ow-static-scanx.dhan.co/staticscanx/indicator";
    	List<EquityEntity> equities = eqRepo.findAll();
    	
    	// Replace with your actual JSON parameters
    	for(EquityEntity eq : equities) {
            
    	String jsonParams = "{\n" +
                "    \"exchange\": \"NSE\",\n" +
                "    \"segment\": \"A\",\n" +
                "    \"security_id\": \""+eq.getSid()+"\",\n" +
                "    \"isin\": \"INE002A01018\",\n" +
                "    \"symbol\": \""+eq.getSymbol()+"\",\n" +
                "    \"minute\": \"D\"\n" +
                "}";
        try {
            // Create URL object
            URL url = new URL(apiUrl);
            
            // Open connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            
            // Set request method
            connection.setRequestMethod("POST");
            
            // Enable input/output streams
            connection.setDoOutput(true);
            
            // Set request headers
            connection.setRequestProperty("Content-Type", "application/json");
            
            // Write JSON parameters to the request body
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonParams.getBytes("utf-8");
                os.write(input, 0, input.length);
            }
            
            // Get response code
            int responseCode = connection.getResponseCode();
            
            // Read response
            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
//                    System.out.println("Response: " + response.toString());
                    String stringResponse = response.toString();

                    try {
                        // Create ObjectMapper instance
                        ObjectMapper objectMapper = new ObjectMapper();

                        // Parse the string response into a JsonNode
                        JsonNode jsonNode = objectMapper.readTree(stringResponse);

                        // Accessing RSI and MACD values
                        JsonNode indicatorNode = jsonNode.path("data").get(0).path("Indicator");

                        for (JsonNode indicator : indicatorNode) {
                            String indicatorName = indicator.path("Indicator").asText();
                            Float value = (float) indicator.path("Value").asDouble();

                            // Save technical indicators to database
                            saveTechnicalIndicatorsToDatabase(eq.getEquityId(), indicatorName, value);
                        }
                    } catch (Exception e) {
//                        e.printStackTrace();
                    }

                    // Close connection
                    connection.disconnect();

                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("Response Code Error: " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }
    
    private void saveTechnicalIndicatorsToDatabase(Integer eqId, String indicatorName, Float value) {
        EqTechnicalEntity existingTechnical = eqTechRepo.findByEqId(eqId);

        if (existingTechnical != null) {
            // Update existing entry
            if ("RSI(14)".equals(indicatorName)) {
                existingTechnical.setRsi(value);
            } else if ("MACD(12,26)".equals(indicatorName)) {
                existingTechnical.setMacd(value);
            }
        } else {
            // Create a new entry
            EqTechnicalEntity newTechnical = new EqTechnicalEntity();
            newTechnical.setEqId(eqId);
            newTechnical.setRsi("RSI(14)".equals(indicatorName) ? value : null);
            newTechnical.setMacd("MACD(12,26)".equals(indicatorName) ? value : null);
            eqTechRepo.save(newTechnical);
        }
        
    }



}
    	
    
    

