package com.gdu.vinery.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.vinery.domain.NoticeDTO;
import com.gdu.vinery.domain.ProductDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.mapper.AdminMapper;
import com.gdu.vinery.util.PageUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
	
	private AdminMapper adminMapper;
	private PageUtil pageUtil;
	
	// 상품 나열
	@Override
	public List<ProductDTO> selectProd() {
		return adminMapper.selectProd();
	}
	
	// 상품 상세
	@Override
	public ProductDTO selectProdByNo(HttpServletRequest request) {
	  String strprodNo = request.getParameter("prodNo");
	  int prodNo = 0;
	  
	  if(strprodNo != null && strprodNo.isEmpty() == false) {
	    prodNo = Integer.parseInt(strprodNo);
	  }
	  return adminMapper.selectProdByNo(prodNo);
	}
	
	// 상품 수정
  @Override
  public Map<String, Object> modifyProd(HttpServletRequest request)  {
  
    int prodNo = Integer.parseInt(request.getParameter("wNo"));
  	String prodName = request.getParameter("wName");
  	String prodNameEng = request.getParameter("wNameEng");
  	int prodPrice = Integer.parseInt(request.getParameter("wPrice"));
  	String prodType = request.getParameter("wType");
  	String prodNation = request.getParameter("wNation");
  	String prodAlcohol = request.getParameter("wAlcohol");
  	String pd = request.getParameter("wDate");
  	Date prodDate = Date.valueOf(pd);
  	int prodStock = Integer.parseInt(request.getParameter("wStock"));
   
    ProductDTO product = new ProductDTO();
   
    product.setProdNo(prodNo);
    product.setProdName(prodName);
    product.setProdNameEng(prodNameEng);
    product.setProdPrice(prodPrice);
    product.setProdType(prodType);
    product.setProdNation(prodNation);
    product.setProdAlcohol(prodAlcohol);
    product.setProdDate(prodDate);
    product.setProdStock(prodStock);
    
    adminMapper.modifyProd(product);
    
    Map<String, Object> map = new HashMap<String, Object>();
    
    map.put("prodNo", prodNo);
    map.put("prodName", prodName);
    map.put("prodNameEng", prodNameEng);
    map.put("prodPrice", prodPrice);
    map.put("prodType", prodType);
    map.put("prodNation", prodNation);
    map.put("prodAlcohol", prodAlcohol);
    map.put("prodDate", prodDate);
    map.put("prodStock", prodStock);
    
    return map;
    
	}
  
  // 상품 제거
  @Override
  public void removeProd(HttpServletRequest request, HttpServletResponse response) {
    int wNo = Integer.parseInt(request.getParameter("wNo"));
    int removeResult = adminMapper.deleteProd(wNo);
    
    try {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
  
      out.println("<script>");
      if(removeResult == 1) {
        out.println("alert('상품이 삭제되었습니다.')");
        out.println("location.href='" + request.getContextPath() + "/admin/prodList.page'");
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
  
  // 상품 삽입
  @Override
  public int insertProd(HttpServletRequest request) {
    
    try {
      String prodName = request.getParameter("wName");
      String prodNameEng = request.getParameter("wNameEng");
      int prodPrice = Integer.parseInt(request.getParameter("wPrice"));
      String prodContent = request.getParameter("wContent");
      String prodThumbnail = request.getParameter("wThumb");
      String prodImg = request.getParameter("wImg");
      String prodType = request.getParameter("wType");
      String prodNation = request.getParameter("wNation");
      String prodBody = request.getParameter("wBody");
      String prodAlcohol = request.getParameter("wAlcohol");
      String pd = request.getParameter("wDate");
      Date prodDate = Date.valueOf(pd);
      int stock = Integer.parseInt(request.getParameter("wStock"));
      
      ProductDTO product = new ProductDTO();
      
      product.setProdName(prodName);
      product.setProdNameEng(prodNameEng);
      product.setProdPrice(prodPrice);
      product.setProdContent(prodContent);
      product.setProdThumbnail(prodThumbnail);
      product.setProdImg(prodImg);
      product.setProdType(prodType);
      product.setProdNation(prodNation);
      product.setProdBody(prodBody);
      product.setProdAlcohol(prodAlcohol);
      product.setProdDate(prodDate);
      product.setProdStock(stock);
      
      return adminMapper.insertProd(product);
      
    } catch (Exception e) {
     
      return 0;
    
    }
  }
  
  
  // 상품 페이징
  @Override
  public void getProdListUsingPagination(HttpServletRequest request, Model model) {
    
    Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt1.orElse("1"));
    
    int totalRecord = adminMapper.getProductsCount();
    
    HttpSession session = request.getSession();
    Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
    int recordPerPage = (int)(opt2.orElse(10));
    
    Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
    String order = opt3.orElse("ASC");
    
    Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
    String column = opt4.orElse("PROD_NAME");
    
    pageUtil.setPageUtil(page, totalRecord, recordPerPage);
    
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("begin", pageUtil.getBegin());
    map.put("end", pageUtil.getEnd());
    map.put("order", order);
    map.put("column", column);
    
    List<ProductDTO> products = adminMapper.getProductListUsingPagination(map);
    
    model.addAttribute("products", products);
    model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/admin/pagination.do?column=" + column + "&order=" + order));
    model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
    
    switch (order) {
    case "ASC"  : model.addAttribute("order", "DESC"); break;
    case "DESC" : model.addAttribute("order", "ASC"); break;
    }

    model.addAttribute("page", page);
    
  }
  
  
  
  @Override
  public List<UserDTO> selectUsers() {
    return adminMapper.selectUsers();
  }
  
  @Override
  public List<NoticeDTO> selectNotices() {
    return adminMapper.selectNotices();
  }
	
}
