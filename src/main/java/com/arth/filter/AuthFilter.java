package com.arth.filter;

import java.io.IOException;

import org.springframework.stereotype.Component;

import com.arth.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		System.out.println("AuthFilter...." + req.getRequestURL());

		HttpSession session = req.getSession();
		UserEntity user = (UserEntity) session.getAttribute("user");
		
		
		String url = req.getRequestURL().toString();
		
		
		if (req.getRequestURL().toString().contains("assets") || url.contains("favic") ) {
			chain.doFilter(request, response);
		}
		else if(req.getRequestURL().toString().contains("login") || url.contains("authenticate")) {
			chain.doFilter(request, response);
		}
		else if (user == null) {
			UserEntity userx = new UserEntity();
			userx.setUserId(2);
			userx.setFirstName("Dummy");
			session.setAttribute("user",userx);
			
			RequestDispatcher rd = req.getRequestDispatcher("/login");
			rd.forward(request, response);
//			res.sendRedirect("/login");
		} else {
			System.out.println("user");
			chain.doFilter(request, response);
		}
	}
}
