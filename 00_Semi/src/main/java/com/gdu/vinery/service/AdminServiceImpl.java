package com.gdu.vinery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<ProductDTO> selectProduct() {
		return adminMapper.selectProduct();
	}
	
	@Override
	public List<UserDTO> selectUsers() {
	  return adminMapper.selectUsers();
	}
	
	@Override
	public ProductDTO selectProductByNo(HttpServletRequest request) {
	  String strprodNo = request.getParameter("prodNo");
	  int prodNo = 0;
	  
	  if(strprodNo != null && strprodNo.isEmpty() == false) {
	    prodNo = Integer.parseInt(strprodNo);
	  }
	  return adminMapper.selectProductByNo(prodNo);
	}
	
}
