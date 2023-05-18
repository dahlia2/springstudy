package com.gdu.staff.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

import com.gdu.staff.domain.StaffDTO;

public interface StaffService {

   public ResponseEntity<List<StaffDTO>> getStaffList2();
   public String addStaff(HttpServletRequest request);
   public ResponseEntity<List<StaffDTO>> searchSno(HttpServletRequest request);
   
}