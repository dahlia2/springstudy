package com.gdu.app03.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.app03.service.IFifthService;

@Controller
public class FifthController {
	
	
	@Autowired
	private IFifthService fifthService;
	
	@GetMapping(value="/papago.do", produces = "application/json")
	public ResponseEntity<String> papago(HttpServletRequest request) {
		return fifthService.execute(request);
		
	}
	

}
