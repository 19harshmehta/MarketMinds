package com.arth.services;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.arth.entity.AlertEntity;
import com.arth.entity.EquityEntity;
import com.arth.entity.UserEntity;
import com.arth.repository.EquityRepository;

@Service
public class MailerService {
	
	@Autowired
	EquityRepository eqRepo;

	public boolean sendMailForForgetpasswordOTP(UserEntity user) {
		final String from = "market.mindss23@gmail.com";// from address
		final String appPassword = "myhrwiyyyeoetepg"; //

		Properties prop = System.getProperties();

		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.enable", "false");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, appPassword);
			}
		});

		session.setDebug(true);

		try {
			MimeMessage message = new MimeMessage(session);

			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
			message.setSubject("OTP For Update Password");
			message.setContent("Please use this OTP for Update Password.... ==> " + user.getOtp(), "text/html");

			Transport.send(message);

			System.out.println("email sent.............");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("something went wrong...........");
			return false;

		}
		return true;
	}
	
	 public void sendAlertEmail(UserEntity user, AlertEntity alert) {
	        final String from = "market.mindss23@gmail.com";// from address
	        final String appPassword = "myhrwiyyyeoetepg"; // Replace with your actual app password

	        Properties prop = System.getProperties();

	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "587");
	        prop.put("mail.smtp.ssl.enable", "false");

	        Session session = Session.getInstance(prop, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(from, appPassword);
	            }
	        });

	        session.setDebug(true);

	        try {
	            MimeMessage message = new MimeMessage(session);
	            
	            EquityEntity eqEntity = (eqRepo.findByEquityId(alert.getEquityId()));
	            message.setFrom(from);
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
	            message.setSubject("Alert: Target Price Crossed");
	            message.setContent("The target price for " + eqEntity.getEquityName() + " (ID: " + alert.getEquityId() +") has been crossed. Its current price is :- "+ eqEntity.getPrice(), "text/html");

	            Transport.send(message);

	            System.out.println("Alert email sent to user " + user.getEmail());
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Failed to send alert email to user " + user.getEmail());
	        }
	    }
	
	
	
	
}