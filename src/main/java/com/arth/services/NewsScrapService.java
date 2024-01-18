package com.arth.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.NewsEntity;
import com.arth.repository.NewsRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.io.IOException;

@Service
public class NewsScrapService 
{
	@Autowired
	NewsRepository newsRepo;
	//public static void main(String[] args) {
	public void scrapNews(NewsEntity newsEntity) {
        String apiKey = "1baf44163bcf4940917088efe1e45c52";
        String apiUrl = "https://newsapi.org/v2/everything?q=sensex%20nse&apiKey=" + apiKey;
        

        try {
            String responseData = sendGetRequest(apiUrl);
            System.out.println(responseData);
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(responseData);
            System.out.println(jsonNode.toPrettyString());
            System.out.println(jsonNode.size());
//            System.out.println(jsonNode);
            
            JsonNode articles = jsonNode.get("articles");
            JsonNode sources = articles.get("source");
            for (JsonNode source : sources) 
            {
            	String sorce = source.get("name").asText();
            	newsEntity.setSource(sorce);
            }
            	
            	for (JsonNode article : articles) {
            		String author = article.get("author").asText();
            		String title = article.get("title").asText();
            		String description = article.get("description").asText();
            		String url = article.get("url").asText();
            		String urlToImage = article.get("urlToImage").asText();
            		String publishedAt = article.get("publishedAt").asText();
            		String content = article.get("content").asText();
            		
            		
            		
            		
            		//set values
            		newsEntity.setAuthor(author);
            		newsEntity.setTitle(title);
            		newsEntity.setDescription(description);
            		newsEntity.setUrl(url);
            		newsEntity.setUrlToImage(urlToImage);
            		newsEntity.setPublishedAt(publishedAt);
            		newsEntity.setContent(content);
//            		newsEntity.setSource(sorce);
            		
            		System.out.println("Author: " + author);
            		System.out.println("Title: " + title);
            		System.out.println("Description: " + description);
            		System.out.println("---");
            		
            		newsRepo.save(newsEntity);
            	
            }
            System.out.println(articles.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
//	public void scrapTest() {
//		
//	}

	private static String sendGetRequest(String apiUrl) throws IOException {
	    try {
	        URL url = new URL(apiUrl);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	        connection.setRequestMethod("GET");

	        int responseCode = connection.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) {
	            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	            StringBuilder response = new StringBuilder();
	            String inputLine;

	            while ((inputLine = in.readLine()) != null) {
	                response.append(inputLine);
	            }

	            in.close();
	            return response.toString();
	        } else {
	            throw new IOException("HTTP request failed. Response Code: " + responseCode);
	        }
	    } catch (Exception e) {
	        throw new IOException("Error during HTTP request", e);
	    }
	}
}
