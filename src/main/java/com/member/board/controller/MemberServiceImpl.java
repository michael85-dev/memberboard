package com.member.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.board.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository mr;
	
	@Override
	public void insert(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		mr.insert(mDTO);
	}

}
