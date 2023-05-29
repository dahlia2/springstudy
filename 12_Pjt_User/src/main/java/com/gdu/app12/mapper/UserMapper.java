package com.gdu.app12.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.app12.domain.LeaveUserDTO;
import com.gdu.app12.domain.SleepUserDTO;
import com.gdu.app12.domain.UserDTO;

@Mapper
public interface UserMapper {
  
  // [아이디] 일반, 휴먼, 탈퇴회원 조회
  public UserDTO selectUserById(String id);
  public SleepUserDTO selectSleepUserById(String id);
  public LeaveUserDTO selectLeaveUserById(String id);
  
  // [이메일] 일반, 휴먼, 탈퇴회원 조회
  public UserDTO selectUserByEmail(String email);
  public SleepUserDTO selectSleepUserByEmail(String email);
  public LeaveUserDTO selectLeaveUserByEmail(String email);
  
  // 회원가입
  public int insertUser(UserDTO userDTO);
  
  // 로그인
  public UserDTO selectUserByUserDTO(UserDTO userDTO);
  // 접속기록
  public int insertUserAccess(String id);
  public int updateUserAccess(String id);
  
  // 자동로그인
  public int insertAutologin(UserDTO userDTO);
  public int deleteAutologin(String id);
  public UserDTO selectAutologin(String autologinId);
  
  // 탈퇴
  public int insertLeaveUser(LeaveUserDTO leaveUserDTO);
  public int deleteUser(String id);
  
  // 휴먼계정 & 복구
  public int insertSleepUser();
  public int deleteUserForSleep();
  public int insertRestoreUser(String id);
  public int deleteSleepUser(String id);
  
  
}