package com.arth.services;

import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmsService {

	public void sendSms(String toPhoneNumber, String message) {
		Twilio.init("AC47c0985281d43fdd1634c0ec423f4334", "ebb041ca9d33fb677359bbb258016eb1");

		// AC47c0985281d43fdd1634c0ec423f4334
		// ebb041ca9d33fb677359bbb258016eb1

		Message sms = Message.creator(new PhoneNumber(toPhoneNumber), new PhoneNumber("+16074006690"), message)
				.create();
		System.out.println(sms.getSid());
		System.out.println(sms.getStatus());
	}

}
//Z25HUBFB8GC2A52FQ4EHL2EH
