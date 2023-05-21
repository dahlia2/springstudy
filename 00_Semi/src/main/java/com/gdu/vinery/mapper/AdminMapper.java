package com.gdu.vinery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

@Mapper
public interface AdminMapper {
	
	public List<ProductDTO> selectProduct();
	public List<UserDTO> selectUsers();
	public ProductDTO selectProductByNo(int prodNo);
  public int modifyProduct(ProductDTO product);

}
