package com.arth.services;

import org.springframework.stereotype.Service;

@Service
public class OtpGenerator 
{

	public int generateNumericOtp(int length) {
		return 0;
	}

	public String generateOtp(int length) {
		String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String Small_chars = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";

		String values = Capital_chars + Small_chars + numbers;

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			// Use of charAt() method : to get character value
			// Use of nextInt() as it is scanning the value as int
			int index = (int) (Math.random() * values.length());
			sb.append(values.charAt(index));
		}
		return sb.toString();
	}
}
