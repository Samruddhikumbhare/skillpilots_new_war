package com.skillpilots.utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class CommonUtil {
	
	@Value("${sms.authkey}")
    private String authkey;

    @Value("${sms.senderId}")
    private String senderId;

    @Value("${sms.route}")
    private String route;

    @Value("${sms.templateId}")
    private String templateId;

    @Value("${sms.type}")
    private String type;

    @Value("${sms.campaign}")
    private String campaign;

    public void sendSms(String msg, long mobileNo) {
        try {
            String encodedMessage = URLEncoder.encode(msg, "UTF-8");
            String mainUrl = "http://whysms.in/app/smsapi/index.php?key=" + authkey +
                             "&campaign=" + campaign +
                             "&contacts=" + mobileNo +
                             "&type=" + type +
                             "&template_id=" + templateId +
                             "&msg=" + encodedMessage +
                             "&routeid=" + route +
                             "&senderid=" + senderId;

            URL url = new URL(mainUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String response;
            while ((response = reader.readLine()) != null) {
                System.out.println(response);
            }
            reader.close();
            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
