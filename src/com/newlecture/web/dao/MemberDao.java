package com.newlecture.web.dao;

import java.util.List;

import com.newlecture.web.data.entity.Member;

public interface MemberDao {
	List<Member> getList(String query);
	int add(Member member);
}


