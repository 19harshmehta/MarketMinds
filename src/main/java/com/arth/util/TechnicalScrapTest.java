package com.arth.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.arth.dto.Root;
import com.fasterxml.jackson.databind.ObjectMapper;

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

				System.out.println(response.toString());
				ObjectMapper mapper = new ObjectMapper();
				root = mapper.readValue(response.toString(), Root.class);

				System.out.println(root);
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

	
	
	public static void main(String[] args) {
		TechnicalScrapTest test = new TechnicalScrapTest();
		
		test.scrapTechnical();

	}

}
