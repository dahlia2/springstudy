package com.gdu.vinery.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ProductDTO selectProductByNo(HttpServletRequest request) {
	  String strprodNo = request.getParameter("prodNo");
	  int prodNo = 0;
	  
	  if(strprodNo != null && strprodNo.isEmpty() == false) {
	    prodNo = Integer.parseInt(strprodNo);
	  }
	  return adminMapper.selectProductByNo(prodNo);
	}
	
  @Override
  public Map<String, Object> modifyProduct(HttpServletRequest request)  {
	int prodNo = Integer.parseInt(request.getParameter("wNo"));
	String prodName = request.getParameter("wName");
	String prodNameEng = request.getParameter("wNameEng");
	int prodPrice = Integer.parseInt(request.getParameter("wPrice"));
    String prodNation = request.getParameter("wNation");
    String prodAlcohol = request.getParameter("wAlcohol");
    int prodStock = Integer.parseInt(request.getParameter("wStock"));
    /* String prodDate = request.getParameter("wprodDate");
    
    Date date = null;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
    try {
		date = (Date) sdf.parse(prodDate);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} */
   
    ProductDTO product = new ProductDTO();
    product.setProdNo(prodNo);
    product.setProdName(prodName);
    product.setProdNameEng(prodNameEng);
    product.setProdPrice(prodPrice);
    product.setProdNation(prodNation);
    product.setProdAlcohol(prodAlcohol);
    product.setProdStock(prodStock);
    // product.setProdDate(date);
    
    adminMapper.modifyProduct(product);
    
    Map<String, Object> map = new HashMap<String, Object>();
    
    map.put("prodNo", prodNo);
    map.put("prodName", prodName);
    map.put("prodNameEng", prodNameEng);
    map.put("prodPrice", prodPrice);
    map.put("prodAlcohol", prodAlcohol);
    map.put("prodStock", prodStock);
    
    return map;
    
	}
  

  @Override
  public void removeProduct(HttpServletRequest request, HttpServletResponse response) {
    int wNo = Integer.parseInt(request.getParameter("wNo"));
    int removeResult = adminMapper.deleteProduct(wNo);
    
    try {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
  
      out.println("<script>");
      if(removeResult == 1) {
        out.println("alert('상품이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/admin/product.page'");
      } else {
        out.println("alert('상품이 삭제되지 않았습니다.')");
        out.println("history.back()");
      }
      out.println("</script>");
      out.flush();
      out.close();
    } catch (Exception e) {
     e.printStackTrace();
    }
    
  }
  
  @Override
  public List<UserDTO> selectUsers() {
    return adminMapper.selectUsers();
  }
	
}
