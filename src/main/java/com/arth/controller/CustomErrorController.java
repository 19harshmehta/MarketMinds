package com.arth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CustomErrorController implements ErrorController {

    
	
	@RequestMapping("/error")
    public String handleError() {
        // Provide your custom error view or redirect to a specific page
    	System.out.println("in error");
        return "Page404"; // Assuming you have an "error.html" template
    }

}