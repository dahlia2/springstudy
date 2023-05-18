package com.gdu.staff.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gdu.staff.domain.StaffDTO;
import com.gdu.staff.mapper.StaffMapper;

@Service
public class StaffServiceImpl implements StaffService {

   @Autowired
   private StaffMapper staffMapper;
   
   
   @Override
   public ResponseEntity<List<StaffDTO>> getStaffList2() {
      List<StaffDTO> staffList = staffMapper.getStaffList();
      HttpHeaders header = new HttpHeaders();
      header.setContentType(MediaType.APPLICATION_JSON);
      return new ResponseEntity<List<StaffDTO>>(staffList, header, HttpStatus.OK);
   }
   

   @Override
   public String addStaff(HttpServletRequest request) {
	   
	   StaffDTO staffDTO = new StaffDTO();
	   try {
		   
		   String sno = request.getParameter("sno");
		   String name = request.getParameter("name");
		   String dept = request.getParameter("dept");
		   staffDTO.setSno(sno);
		   staffDTO.setName(name);
		   staffDTO.setDept(dept);
		   
		   if(dept.matches("[가-힣]{3,5}")) {
			   staffMapper.addStaff(staffDTO);
		   }
		   return "사원 등록이 성공했습니다.";
		   
		   
	   } catch(Exception e) {
		   
		   return "사원 등록이 실패했습니다.";   
	   }

   }
   
   
   // 조회
   @Override
	public ResponseEntity<List<StaffDTO>> searchSno(HttpServletRequest request) {
	   
	   List<StaffDTO> staffList = null;
	   
	   try {
		   
		   String query = request.getParameter("query");
		   
		   if (query.matches("[0-9]{5}")) {
		       staffList = staffMapper.searchSno(query);
		   }
	
		   HttpHeaders header = new HttpHeaders();
		   header.setContentType(MediaType.APPLICATION_JSON);
	   
		   return new ResponseEntity<List<StaffDTO>>(staffList, header, HttpStatus.OK);
		   
	   } catch(Exception e) {
		   return new ResponseEntity<List<StaffDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	   
   }

}
