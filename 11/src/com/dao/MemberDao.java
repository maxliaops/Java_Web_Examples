package com.dao;

import java.util.List;

import com.model.Member;

public interface MemberDao {
  public int insert(Member m);
  public int update(Member m);
  public int delete(Member m);
  public List select();
  public Member select1();
}
