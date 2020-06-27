package com.fpt.service;

import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.exception.TwilioException;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class TwilioMessageCreator {
	public static final String ACCOUNT_SID = "AC07ce8ce3bede487011be6cc5f38a6985";
	public static final String AUTH_TOKEN = "b79b022f393992514f36c92b0d0ee054";
	public static final String TWILIO_NUMBER = "+12058830134";

	public void sendSMS(String msg, String phone) throws TwilioException {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		Message message = Message.creator(new PhoneNumber("+84" + phone.substring(1)), // to
				new PhoneNumber(TWILIO_NUMBER), // from
				msg).create();

		System.out.println(message.getSid());
	}

}
