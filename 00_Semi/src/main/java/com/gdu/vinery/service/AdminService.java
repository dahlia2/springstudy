package com.gdu.vinery.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

public interface AdminService {
	
  // 상품관리
	public List<ProductDTO> selectProduct();
	public ProductDTO selectProductByNo(HttpServletRequest request);
	public Map<String, Object> modifyProduct(HttpServletRequest request);
	
	public List<UserDTO> selectUsers();

}
