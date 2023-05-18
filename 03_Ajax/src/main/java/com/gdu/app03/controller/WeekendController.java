package com.gdu.app03.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.app03.service.IWeekendService;

@Controller
public class WeekendController {
	
	private IWeekendService weekendservice;

	public WeekendController(IWeekendService weekendservice) {
		super();
		this.weekendservice = weekendservice;
	}
	
	@GetMapping(value="/naver.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> naver(HttpServletRequest request) {
		return weekendservice.gogo(request);
	}

}