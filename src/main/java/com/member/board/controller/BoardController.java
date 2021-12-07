package com.member.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@RequestMapping(value="saveform", method=RequestMethod.GET)
	public String saveForm() {
		System.out.println("saveform 전달 받음");
		System.out.println("save.jsp 요청됨");
		
		return "save";
	}
	
	
}
