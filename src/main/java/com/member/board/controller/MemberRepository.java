package com.member.board.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.board.dto.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void insert(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		sql.insert("Member.insert", mDTO);
	}

}
