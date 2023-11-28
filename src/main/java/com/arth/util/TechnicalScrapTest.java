package com.arth.util;

import java.io.BufferedReader;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.arth.dto.Root;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonParser;

public class TechnicalScrapTest {

	public Root scrapTechnical() {
		Root root = null;
		String apiUrl = "https://openweb-analytical.dhan.co/analytical/getTechnicalIndicator";

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setDoOutput(true);

//			String param = "{entity_id: OpenWeb,source: O,token_id: '',iv: '',data: { exchange: NSE,segment: E,security_id: 21238,isin: INE949L01017,symbol: AUBANK,minute: D,}}";
			String param = "{\"entity_id\": \"OpenWeb\", \"source\": \"O\", \"token_id\": \"\", \"iv\": \"\", \"data\": { \"exchange\": \"NSE\", \"segment\": \"E\", \"security_id\": 21238, \"isin\": \"INE949L01017\", \"symbol\": \"AUBANK\", \"minute\": \"D\" }}";
			
			
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
//				JsonElement json = JsonParser.parseString(response.toString());
//				System.out.println(json);
				System.out.println(response);
//				ObjectMapper mapper = new ObjectMapper();
//				root = mapper.readValue(response.toString(), Root.class);

//				System.out.println(root);
//				System.out.println(root.getResponseDTOList());
//				System.out.println(root.getResponseDTOList().get(0));
//				System.out.println(root.getResponseDTOList().get(0).getSn());
//				System.out.println(root.getLastUpdateTime().getValue());
				
				JsonNode rootNode = new ObjectMapper().readTree(response.toString());

	            // Extract values for "MACD (12,26)"
	            JsonNode macdNode = rootNode.path("data").path(3).path("Indicator").findValue("MACD (12,26)");
	           
	            System.out.println(rootNode.get(2));
	            System.out.println(macdNode);
	            String macdAction = macdNode.path("Action").asText();		
	            double macdValue = macdNode.path("Value").asDouble();
	            System.out.println("MACD (12,26): Action=" + macdAction + ", Value=" + macdValue);

	            // Extract values for "RSI (14)"
	            JsonNode rsiNode = rootNode.path("data").path(0).path("Indicator").findValue("RSI (14)");
	            String rsiAction = rsiNode.path("Action").asText();
	            double rsiValue = rsiNode.path("Value").asDouble();
	            System.out.println("RSI (14): Action=" + rsiAction + ", Value=" + rsiValue);

			} else {
				System.out.println("GET request failed with response code: " + responseCode);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return root;
	}

	
	
	public static void main(String[] args) {
		TechnicalScrapTest test = new TechnicalScrapTest();
		
		test.scrapTechnical();

	}

}
