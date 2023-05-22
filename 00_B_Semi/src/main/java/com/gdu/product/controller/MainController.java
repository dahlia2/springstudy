package com.gdu.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.product.domain.ProductDTO;
import com.gdu.product.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/main.do")
	public String newAndbest(Model model) {
		List<ProductDTO> newProducts = productService.getNewArrival(model);
		List<ProductDTO> bestProducts = productService.getBestSeller(model);
		model.addAttribute("newProducts", newProducts);
		model.addAttribute("bestProducts", bestProducts);
		return "product/main";
	}
	
	@GetMapping("/detail.do")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("p", productService.detail(request));
		return "product/detail";
	}
	
	@GetMapping("/search.do")
	public String search(HttpServletRequest request, Model model) {
		productService.getWineListUsingSearch(request, model);
		return "product/search";
	}
	
	@GetMapping("/management.do")
	public String management(Model model) {
		List<ProductDTO> wineList = productService.getAllList(model);
		model.addAttribute("wineList", wineList);
		return "product/management";
	}
	
}
