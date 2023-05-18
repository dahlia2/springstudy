package com.gdu.app03.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

class FifthServiceImpl implements IFifthService {
	
	@Override
	public ResponseEntity<String> execute(HttpServletRequest request) {
		
		try {
			
			// 요청 파라미터
			String source = request.getParameter("source");
			String target = request.getParameter("target");
			String text = request.getParameter("text");
			
			// 클라이언트 아이디, 시크릿 (네이버 개발자 센터에서 발급 받은 본인 정보 사용)
			String clientId = "QiCcDlsw4QIrGip09ROG";
			String clientSecret = "J58f0EAvhE";
			
			// API 주소
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			
			// URL
			URL url = new URL(apiURL);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			
			// 요청 메소드
			con.setRequestMethod("GET");
			
			// 요청 헤더에 포함하는 내용
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			// Papago API로 보내야 하는 파라미터(source, target, text)
			String params = "source=" + source + "&target=" + target + "&text=" + URLEncoder.encode(text, "UTF-8");

			// Papago API로 파라미터 보내기 위해서 출력 스트림 생성
			con.setDoOutput(true);
			DataOutputStream dos = new DataOutputStream(con.getOutputStream());

			// Papago API로 파라미터 보내기
			dos.write(params.getBytes());  // 스트림은 byte만 받을 수 있으므로 String->bytes으로 변환
			dos.flush();
			dos.close();
			
			// Papago API로부터 번역 결과를 받아 올 입력 스트림 생성
			BufferedReader reader = null;
			if(con.getResponseCode() == 200) {
				reader = new BufferedReader(new java.io.InputStreamReader(con.getInputStream()));
			} else {
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			// Papago API로부터 번역 결과를 받아서 StringBuilder에 저장
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line = reader.readLine()) != null) {
				sb.append(line);
			}
			
			// Papago API로부터 받은 번역 결과 자체가 문자열 형식의 JSON 데이터이다.
			// 따라서 받은 내용을 그대로 보내준다.
			// 여기서 보내는 데이터의 타입은 String으로 처리하지만,
			// $.ajax에서 받는 데이터의 타입은 'json'으로 처리해 준다.(dataType: 'json')
			return new ResponseEntity<String>(sb.toString(), HttpStatus.OK);
			
		} catch(Exception e) {
			
			return new ResponseEntity<String>(HttpStatus.SERVICE_UNAVAILABLE);
		}
	}

}
