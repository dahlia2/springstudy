package com.gdu.product.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.product.domain.ProductDTO;
import com.gdu.product.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<ProductDTO> getNewArrival(Model model) {
		return productMapper.getNewArrival();
	}

	public List<ProductDTO> getBestSeller(Model model) {
		return productMapper.getBestSeller();
	}	
	
	@Override
	public ProductDTO detail(HttpServletRequest request) {
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		return productMapper.detail(prodNo);
	}
	
	@Override
	public void getWineListUsingSearch(HttpServletRequest request, Model model) {
		Optional<String> opt = Optional.ofNullable(request.getParameter("query"));
		String query = opt.orElse("");
		model.addAttribute("query", query);
		
		List<ProductDTO> product = productMapper.getWineListUsingSearch(query);
		model.addAttribute("product", product);	
	}
	
	@Override
	public List<ProductDTO> getAllList(Model model) {
		return productMapper.getAllList();
	}
	
	
	
}