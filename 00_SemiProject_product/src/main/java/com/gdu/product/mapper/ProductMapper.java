package com.gdu.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.product.domain.ProductDTO;

@Mapper
public interface ProductMapper {
	
	public List<ProductDTO> getBestSeller();
	public List<ProductDTO> getNewArrival();
	public List<ProductDTO> getAllList();
	
	public ProductDTO detail(int prodNo);
	public List<ProductDTO> getWineListUsingSearch(String query);

}
