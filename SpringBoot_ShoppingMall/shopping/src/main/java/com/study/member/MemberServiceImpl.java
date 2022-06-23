package com.study.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

  @Autowired
  private MemberMapper mapper;

  @Override
  public int duplicatedId(String id) {
    // TODO Auto-generated method stub
    return mapper.duplicatedId(id);
  }

  @Override
  public int duplicatedEmail(String email) {
    // TODO Auto-generated method stub
    return mapper.duplicatedEmail(email);
  }

  @Override
  public int create(MemberDTO dto) {
    // TODO Auto-generated method stub
    return mapper.create(dto);
  }

  @Override
  public int loginCheck(Map<String, String> map) {
    // TODO Auto-generated method stub
    return mapper.loginCheck(map);
  }

  @Override
  public Map getGrade(String id) {
    // TODO Auto-generated method stub
    return mapper.getGrade(id);
  }

  @Override
  public MemberDTO read(String id) {
    // TODO Auto-generated method stub
    return mapper.read(id);
  }

  @Override
  public int update(MemberDTO dto) {
    // TODO Auto-generated method stub
    return mapper.update(dto);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public List<MemberDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int updateFile(Map map) {
    // TODO Auto-generated method stub
    return mapper.updateFile(map);
  }

  @Override
  public MemberDTO mypage(String id) {
    // TODO Auto-generated method stub
    return mapper.mypage(id);
  }

  @Override
  public String findId(Map<String, String> map) {
    // TODO Auto-generated method stub
    return mapper.findId(map);
  }


  @Override
  public String findPw(Map<String, String> map) {
    // TODO Auto-generated method stub
    return mapper.findPw(map);
  }







}