package com.member.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.board.dto.BoardDTO;
import com.member.board.dto.CommentDTO;
import com.member.board.service.BoardService;
import com.member.board.service.CommentService;

@Controller
@RequestMapping(value="/comment/*")
public class CommentController {
	@Autowired
	private CommentService cs;
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public List<CommentDTO> save(@ModelAttribute CommentDTO cDTO) { //, @RequestParam("b_number") long b_number, Model model) {
		System.out.println("Comment.save 호출됨");
		cs.save(cDTO);
//		BoardDTO bDTO = bs.detail(b_number);
//		long bNumber = bDTO.getB_number();
		List<CommentDTO> cList = cs.findAll(cDTO.getB_number());
		
		return cList;
	}
}
