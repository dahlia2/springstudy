package com.gdu.app03.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

public class WeekendServiceImpl implements IWeekendService {
	
	public ResponseEntity<String> gogo(HttpServletRequest request) {

			// 요청 파라미터
			String count = request.getParameter("count");
			String same = request.getParameter("same");
			String date = request.getParameter("date");
			String row = request.getParameter("row");
			String high = request.getParameter("high");
			
			
			// 클라이언트 아이디, 시크릿
	        String clientId = "QiCcDlsw4QIrGip09ROG"; 
	        String clientSecret = "J58f0EAvhE"; 

	        String text = null;
	        
	        try {
	            text = URLEncoder.encode("count", "UTF-8");
	            text += URLEncoder.encode("same", "UTF-8");
	            text += URLEncoder.encode("date", "UTF-8");
	            text += URLEncoder.encode("row", "UTF-8");
	            text += URLEncoder.encode("high", "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패", e);
	        }
	        
	        // 요청 주소 
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    


	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        System.out.println(responseBody);
			return null;
	        
	    }


	    private static String get(String apiUrl, Map<String, String> requestHeaders){
	    	HttpURLConnection con = connect(apiUrl);
	    	try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else {   // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	            
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }
	}