//package com.arth.config;
//
//import org.springframework.boot.web.servlet.error.ErrorController;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class WebConfig implements ErrorController {
//
//    private static final String PATH = "/error";
//
//    @RequestMapping(value = PATH)
//    public String error() {
//        return "error/404"; // Assuming you placed your 404.html in a folder named "error"
//    }
//
//    
//    public String getErrorPath() {
//        return PATH;
//    }
//}
