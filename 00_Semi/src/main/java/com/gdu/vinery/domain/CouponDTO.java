package com.gdu.vinery.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO {
	
	private int couponNo;
	private String couponName;
	private int couponDiscount;
	private String couponStartdate;
	private String couponExpired;

}
