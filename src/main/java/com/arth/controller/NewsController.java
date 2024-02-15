package com.arth.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.arth.entity.NewsEntity;
import com.arth.repository.NewsRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.io.IOException;

@Controller
public class NewsController 
{
//	@Autowired
//	NewsScrapService newsService;
	
	@Autowired
	NewsRepository newsRepo;
	
	
	@GetMapping("/newsscrap")
	public String scrapNews()
	{
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
            System.out.println();
//            for (JsonNode source : sources) {
//            	String sorce = source.get("name").asText();
//            	newsEntity.setSource(sorce);
//        		
//            }
            	
            	for (JsonNode article : articles) {
            		JsonNode sorces = article.get("source");
            		NewsEntity newsEntity = new NewsEntity();
            		//for(JsonNode source : sources) {
            			String sourceName = sorces.get("name").asText();
            			newsEntity.setSource(sourceName);
            		//}
            		String author = article.get("author").asText();
            		String title = article.get("title").asText();
            		String description = article.get("description").asText();
            		String url = article.get("url").asText();
            		String urlToImage = article.get("urlToImage").asText();
            		String publishedAt = article.get("publishedAt").asText();
            		String content = article.get("content").asText();
            		System.out.println("Description=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+description.length());
            		
            		
            		
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
            	return "Login";
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return "Signup";
		
	}
	
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
	
	@GetMapping("/newsuser")
	public String newsUser(Model model)
	{
		List<NewsEntity> news = newsRepo.findAll();
		model.addAttribute("news",news);
		return "NewsUser";
	}
	

	@GetMapping("/newsanalyst")
	public String newsAnalyst(Model model)
	{
		List<NewsEntity> news = newsRepo.findAll();
		model.addAttribute("news",news);
		return "NewsAnalyst";
	}
	
	@GetMapping("/newsadmin")
	public String newsAdmin(Model model)
	{
		List<NewsEntity> news = newsRepo.findAll();
		model.addAttribute("news",news);
		return "NewsAdmin";
	}
}


