 package com.gdu.product.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	
	private int prodNo;
	private String prodName;
	private String prodNameEng;
	private int prodPrice;
	private String prodContent;
	private String prodImgWine;
	private String prodImgContent;
	private String prodType;
	private String prodNation;
	private String prodBody;
	private String prodAlcol;
	private String prodDate;
	private int prodStock;
	private int prodSellCount;

}
