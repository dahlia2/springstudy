package com.gdu.app03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcController {

	@GetMapping("/")
	public String welcome() {
		return "index";      /*  /WEB-INF/views/index.jsp  // 뷰 해석기 덕분에 jsp 파일로 이동할 수 있었음  */
	}
	
	@GetMapping("/first.do")
	public String first() {
		return "first";
	}
	
	@GetMapping("/second.do")
	public String second() {
		return "second";
	}
	
	@GetMapping("/third.do")
	public String third() {
		return "third";
	}
	
	@GetMapping("/fourth.do")
	public String fourth() {
		return "fourth";
	}
	
	@GetMapping("/fifth.do")
	public String fifth() {
		return "fifth";
	}
	
	@GetMapping("/Weekend.do")
	public String weekend() {
		return "weekend";
	}
	
}