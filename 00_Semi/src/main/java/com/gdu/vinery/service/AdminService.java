package com.gdu.vinery.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

public interface AdminService {
	
  // 상품관리
	public List<ProductDTO> selectProduct();
	public ProductDTO selectProductByNo(HttpServletRequest request);
	public Map<String, Object> modifyProduct(HttpServletRequest request);
	public void removeProduct(HttpServletRequest request, HttpServletResponse response);
	
	public List<UserDTO> selectUsers();

}
