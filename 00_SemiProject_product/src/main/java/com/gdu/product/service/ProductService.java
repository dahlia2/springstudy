package com.gdu.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.product.domain.ProductDTO;

public interface ProductService {
	
	// 조회
	public List<ProductDTO> getNewArrival(Model model);
	public List<ProductDTO> getBestSeller(Model model);
	public List<ProductDTO> getAllList(Model model);
	
	// 상세
	public ProductDTO detail(HttpServletRequest request);
	
	// 검색
	public void getWineListUsingSearch(HttpServletRequest request, Model model);

}
