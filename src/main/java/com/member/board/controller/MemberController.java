package com.member.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.member.board.dto.MemberDTO;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value="insertform", method=RequestMethod.GET)
	public String insertForm() {
		System.out.println("회원가입 페이지 요청됨(insertform");
		
		return "member/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute MemberDTO mDTO) {
		System.out.println("insert 데이터 전송됨");
		ms.insert(mDTO);
		
		return "index";
	}
	
	@RequestMapping(value="loginform", method=RequestMethod.GET)
	public String loginForm() {
		System.out.println("login을 위한 form 요청됨");
		
		return "member/login";
	}
}
