package com.study.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface MemberMapper {

  MemberDTO mypage(String id);
  
  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int create(MemberDTO dto);

  int loginCheck(Map<String, String> map);

  Map getGrade(String id);

  MemberDTO read(String id);

  int update(MemberDTO dto);

  int total(Map map);

  List<MemberDTO> list(Map map);

  int updateFile(Map map);
    
  int findId(Map<String, String> map);
  
  String getId(String string);
  
  int findPw(Map<String, String> map);

  String getPasswd(String string);



}