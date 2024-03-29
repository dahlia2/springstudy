package com.gdu.app03.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;

import com.gdu.app03.domain.BmiVO;

public class SecondServiceImpl implements ISecondService {

	
	/*
	 	ResponseEntity<T> 클래스
	 	1. Ajax 응답 데이터를 생성하는 클래스
	 	2. 생성자 중 하나의 사용법
	 		public ResponseEntity(@Nullable T body, @Nullable MultiValueMap<String, String> headers, HttpStatus status)
	 		1) @Nullable T body 								: 실제로 응답할 데이터 (응답할 데이터가 null값이어도 오류 발생 x)
	 		2) @Nullable MultiValueMap<String, String> headers  : 응답 헤더(대표적으로 Content-Type)
	 		3) HttpStatus status								: 응답 코드(200, 404, 500, 등) -> try catch가 없어도 응답 코드를 보낼 수 있음
	*/
	
	
	@Override
	public ResponseEntity<BmiVO> execute1(HttpServletRequest request) {
		
		try {
	
			double weight = Double.parseDouble(request.getParameter("weight"));
			double height = Double.parseDouble(request.getParameter("height")) / 100;
			
			double bmi = weight / (height * height);  // bmi = 몸무게(kg) / 키(m)*키(m)
			String obesity = null;
			if(bmi < 18.5) {
				obesity = "저체중";
			} else if(bmi < 24.9) {
				obesity = "정상";
			} else if(bmi < 29.9) {
				obesity = "과체중";
			} else {
				obesity = "비만";
			}
			
			// 성공시 응답보낼 데이터객체, 응답코드 성공 200
			// 실제 응답할 데이터 : new BmiVO(weight, height, bmi, obesity)
			// 응답 코드          : HttpStatus.OK(200을 의미한다.)
			return new ResponseEntity<BmiVO>(new BmiVO(weight, height, bmi, obesity), HttpStatus.OK);
						
		
		} catch (Exception e) {
			
			// 예외 발생시 응답보낼데이터 null, 서버오류 500
			// 메소드 return 값을 맞춰야 하니 바로 null 입력 X
			BmiVO bmiVO = null;
			return new ResponseEntity<BmiVO>(bmiVO, HttpStatus.INTERNAL_SERVER_ERROR);  // HttpStatus가 500이므로 $.ajax의 error에서 처리된다.
		
		}
		
	}
	
	
	@Override
	public ResponseEntity<Map<String, Object>> execute2(BmiVO bmiVO) {
		
		double weight = bmiVO.getWeight();
		double height = bmiVO.getHeight();
		
		if(weight == 0 || height == 0) {
			return new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);  // 응답 코드가 정상(200)이 아니므로 $.ajax의 error로 전달
		}
		
		double bmi = weight / (height * height / 10000);  // bmi = 몸무게(kg) / 키(m)*키(m)
		String obesity = null;
		if(bmi < 18.5) {
			obesity = "저체중";
		} else if(bmi < 24.9) {
			obesity = "정상";
		} else if(bmi < 29.9) {
			obesity = "과체중";
		} else {
			obesity = "비만";
		}
		
		// 실제로 응답할 데이터
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bmi", bmi);
		map.put("obesity", obesity);
		
		// 응답 헤더(Content-Type) - @GetMapping의 produces 대신 사용
		MultiValueMap<String, String> header = new HttpHeaders();
		header.add("Content-Type", MediaType.APPLICATION_JSON_VALUE);
		
		// 성공시 응답 보낼 데이터, 응답헤더, 응답코드
		return new ResponseEntity<Map<String,Object>>(map, header, HttpStatus.OK);
	}
	
	/*
		@Override
		public BmiVO execute1(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				
				double weight = Double.parseDouble(request.getParameter("weight"));
				double height = Double.parseDouble(request.getParameter("height")) / 100;
				
				double bmi = weight / (height * height);  // bmi = 몸무게(kg) / 키(m)*키(m)
				String obesity = null;
				if(bmi < 18.5) {
					obesity = "저체중";
				} else if(bmi < 24.9) {
					obesity = "정상";
				} else if(bmi < 29.9) {
					obesity = "과체중";
				} else {
					obesity = "비만";
				}
				
				return new BmiVO(weight, height, bmi, obesity);     // $.ajax의 success로 넘기는 값
				
			} catch(Exception e) {
				
				try {
					response.setContentType("text/plain; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("몸무게와 키 입력을 확인하세요.");  // $.ajax의 error로 넘기는 예외 메시지
					out.flush();
					out.close();
				} catch(Exception e2) {
					e2.printStackTrace();
				}
				return null;
				
			}
		
		}
		
		@Override
		public Map<String, Object> execute2(BmiVO bmiVO) {
			
			double weight = bmiVO.getWeight();
			double height = bmiVO.getHeight() / 100;
			
			double bmi = weight / (height * height);
			String obesity = null;
			if(bmi < 18.5) {
				obesity = "저체중";
			} else if(bmi < 24.9) {
				obesity = "정상";
			} else if(bmi < 29.9) {
				obesity = "과체중";
			} else {
				obesity = "비만";
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bmi", bmi);
			map.put("obesity", obesity);
			return map;
		
		}
	 */

}