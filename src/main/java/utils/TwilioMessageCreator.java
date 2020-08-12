package utils;

import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.exception.TwilioException;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class TwilioMessageCreator {
	public static final String ACCOUNT_SID = "ACfe35b2c43cd0d2d66171560868cafa98";
	public static final String AUTH_TOKEN = "8df5757d9e3d4372522acde457ce6297";
	public static final String TWILIO_NUMBER = "+14843095586";

	public void sendSMS(String msg, String phone) throws TwilioException {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

		Message message = Message.creator(new PhoneNumber("+84" + phone.substring(1)), // to
				new PhoneNumber(TWILIO_NUMBER), // from
				msg).create();

		System.out.println(message.getSid());
	}

}
