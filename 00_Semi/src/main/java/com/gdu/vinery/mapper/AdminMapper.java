package com.gdu.vinery.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;

@Mapper
public interface AdminMapper {
	
  // 상품관리
	public List<ProductDTO> selectProduct();
	public ProductDTO selectProductByNo(int prodNo);
  public int modifyProduct(ProductDTO product);
  public int deleteProduct(int wNo);

  // 회원관리
  public List<UserDTO> selectUsers();
}
