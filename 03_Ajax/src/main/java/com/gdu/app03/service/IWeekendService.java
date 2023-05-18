package com.gdu.app03.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

public interface IWeekendService {
	
	public ResponseEntity<String> gogo(HttpServletRequest request);

}
