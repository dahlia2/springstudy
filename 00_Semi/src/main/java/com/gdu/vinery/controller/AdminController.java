package com.gdu.vinery.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
  private AdminService adminService;
	
	@GetMapping("/main.page")
	public String mainList() {
		return "admin/main";	
	}
	
	@GetMapping("/product.page")
	public String productList(Model model) {
		List<ProductDTO> wineList = adminService.selectProduct();
		model.addAttribute("wineList", wineList);
		return "admin/product";	
	}
	
	@GetMapping("/detailWine.page")
	public String detailWine(HttpServletRequest request, Model model) {
	  model.addAttribute("w", adminService.selectProductByNo(request));
	  return "admin/productDetail";
	}
	
	
	@GetMapping("/user.page")
	public String memberList(Model model) {
	  List<UserDTO> userList = adminService.selectUsers();
	  model.addAttribute("userList", userList);
		return "admin/user";	
	}
	
	@GetMapping("/board.page")
	public String boardList() {
		return "admin/board";	
	}
	
	@GetMapping("/order.page")
	public String order() {
		return "admin/order";	
	}
	
}
