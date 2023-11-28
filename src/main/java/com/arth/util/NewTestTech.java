package com.arth.util;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class NewTestTech {
    public static void main(String[] args) {
    	
    	
        try {
            // API URL
            String apiUrl = "https://openweb-analytical.dhan.co/analytical/getTechnicalIndicator";

            // JSON data to be sent in the request body
            String jsonData = "{\"entity_id\":\"OpenWeb\",\"source\":\"O\",\"token_id\":\"\",\"iv\":\"\",\"data\":{\"exchange\":\"NSE\",\"segment\":\"E\",\"security_id\":21238,\"isin\":\"INE949L01017\",\"symbol\":\"AUBANK\",\"minute\":\"D\"}}";

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

            // Write data to the connection output stream
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonData.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Get response code
            int responseCode = connection.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            // Read response
            try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                System.out.println("Response: " + response.toString());

                // Parse JSON response
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode jsonNode = objectMapper.readTree(response.toString());
                System.out.println("JSON Structure: " + jsonNode.toPrettyString());
//                System.out.println("outif");
                // Extract RSI and MACD data
                JsonNode dataNode = jsonNode.at("/data");
                if (dataNode.isArray() && dataNode.size() > 0) {
                    JsonNode indicatorNode = dataNode.get(1).at("/Indicator");
//                    System.out.println("in if");
                 
//                    System.out.println(dataNode.get(1).at("/Indicator"));
                    for (JsonNode node : indicatorNode) {
//                    	System.out.println("in for");
                        String indicatorName = node.get("Indicator").asText();
                        if (indicatorName.equals("RSI (14)") || indicatorName.equals("MACD (12,26)")) {
                            String action = node.get("Action").asText();
                            double value = node.get("Value").asDouble();
                            System.out.println("Indicator: " + indicatorName + ", Action: " + action + ", Value: " + value);
                        }
                    }
                }
            }

            // Close connection
            connection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
