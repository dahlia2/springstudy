package com.gdu.app03.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

import com.gdu.app03.domain.BmiVO;

public interface ISecondService {
	
	public ResponseEntity<BmiVO> execute1(HttpServletRequest request);  // BmiVO 객체 말고 다른 것도 담겠다는 의미
	public ResponseEntity<Map<String, Object>> execute2(BmiVO bmiVO);
	
	// public BmiVO execute1(HttpServletRequest request, HttpServletResponse response);
	// public Map<String, Object> execute2(BmiVO bmiVO);
	
}
