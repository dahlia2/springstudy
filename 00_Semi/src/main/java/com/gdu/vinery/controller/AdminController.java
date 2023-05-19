package com.gdu.vinery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@GetMapping("/main.form")
	public String mainList() {
		return "admin/main";	
	}
	
	@GetMapping("/product.form")
	public String productList() {
		return "admin/product";	
	}
	
	@GetMapping("/member.form")
	public String memberList() {
		return "admin/member";	
	}
	
	@GetMapping("/board.form")
	public String boardList() {
		return "admin/board";	
	}
	
	@GetMapping("/order.form")
	public String order() {
		return "admin/order";	
	}
	
}
