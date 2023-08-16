package com.arth.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class EquityController 
{
//		@Autowired
//		CsvService csvservice;
	
	
		@GetMapping("equity")
		public String getEquity()
		{
//			csvservice.saveCsvData("C:\\Users\\HP\\Downloads");
//			System.out.println("data imported");
			return "AddEquity";
		}
		
		@PostMapping("addequity")
		public String postEquityByUpload(@RequestParam("file") MultipartFile file)
		{
			
			return "AddEquity";
		}
	
	

}
