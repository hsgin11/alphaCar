package com.study.kakao;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class kakao {

	@RequestMapping("kakao")
	public String kakaopay(String itemName, String totalAmount, String user, HttpServletRequest req) {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 777cb2c839e43921a0d1a5b2cdb87e53");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			String params = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=" + user
					+ "&item_name="+URLEncoder.encode(itemName, "UTF-8")+"&quantity=1&total_amount="+totalAmount+"&vat_amount=0&tax_free_amount=0"
					+ "&approval_url=http://192.168.1.40:7001/alphacar/successpayment&fail_url=http://192.168.1.40:7001/alphacar/failpayment&cancel_url=http://192.168.1.40:7001/alphacar/cancelpayment";
			System.out.println(params);
			OutputStream out = conn.getOutputStream();
			DataOutputStream dout = new DataOutputStream(out);
			dout.writeBytes(params);
			dout.close();

			int result = conn.getResponseCode();

			InputStream in;
			if (result == 200) {
				in = conn.getInputStream();
			} else {
				in = conn.getErrorStream();
			}
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader bfr = new BufferedReader(isr);
			return bfr.readLine();

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "{\"result\":\"NO\"}";
	}

}
