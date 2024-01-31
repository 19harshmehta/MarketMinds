package com.arth.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.arth.entity.EquityEntity;
import com.arth.repository.EquityRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



public class ApiCaller {
	
	public void testTechnical() {
String apiUrl = "https://customscan.dhan.co/customscan/fetchdt";
        
        // Replace with your actual JSON parameters
        String jsonParams = "{\n" +
                "    \"data\": {\n" +
                "        \"sort\": \"Sym\",\n" +
                "        \"sorder\": \"asc\",\n" +
                "        \"count\": 10000,\n" +
                "        \"params\": [\n" +
                "            {\n" +
                "                \"field\": \"OgInst\",\n" +
                "                \"op\": \"\",\n" +
                "                \"val\": \"ES\"\n" +
                "            },\n" +
                "            {\n" +
                "                \"text\": [\n" +
                "                    \"Sym\"\n" +
                "                ],\n" +
                "                \"op\": \"SW\",\n" +
                "                \"val\": \"a\"\n" +
                "            }\n" +
                "        ]\n" +
                "    }\n" +
                "}";
//        List<EquityEntity> equityEntities = equityRepo.findAll();
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

                        // Now you can work with the JsonNode as needed
                        System.out.println("Parsed JSON:\n" + jsonNode.toPrettyString());


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
	}
	
	
    public static void main(String[] args) {
    	ApiCaller test = new ApiCaller();
    	test.testTechnical();
    }
}
