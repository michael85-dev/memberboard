package com.member.board.controller;

import java.io.IOException;
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
import com.member.board.dto.PageDTO;
import com.member.board.service.BoardService;
import com.member.board.service.CommentService;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private CommentService cs;
	
	@RequestMapping(value="saveform", method=RequestMethod.GET)
	public String saveForm() {
		System.out.println("saveform 전달 받음");
		System.out.println("save.jsp 요청됨");
		
		return "board/save";
	}
	
	@RequestMapping(value="save", method=RequestMethod.POST)
	public String save(@ModelAttribute BoardDTO bDTO) throws IllegalStateException, IOException {
		System.out.println("글 쓰기 페이지 호출됨(save.jsp)");
		bs.save(bDTO);
		
		return "board/main";
	}
	
	@RequestMapping(value="findAll", method=RequestMethod.GET)
	public String findAll(Model model) {
		System.out.println("findAll,jsp 호출됨");
		List<BoardDTO> bList = bs.findAll();
		model.addAttribute("bList", bList);
		
		return "board/findAll";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET) // comment, page 처리 미완
	public String detail(@RequestParam("b_number") long b_number, Model model,   @RequestParam(value="page", required=false, defaultValue="1")int page) {
		BoardDTO bDTO = bs.detail(b_number);
		model.addAttribute("bDTO", bDTO);
		model.addAttribute("page", page);
		List<CommentDTO> cList = cs.findAll(b_number);
		model.addAttribute("cList", cList);
		
		return"board/detail";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("b_number") long b_number, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		System.out.println("update.jsp 호출됨");
		BoardDTO bDTO = bs.detail(b_number);
		model.addAttribute("bDTO", bDTO);
		model.addAttribute("page", page);
			
		return "board/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardDTO bDTO, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		model.addAttribute("page", page);
		bs.update(bDTO);
		
		return "redirect:/board/detail?b_number=" + bDTO.getB_number() + "&page=" + page;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(@RequestParam("b_number") long b_number) {
		bs.delete(b_number);
		
		return "redirect:/board/findAll";
	}
	
	@RequestMapping(value="paging", method=RequestMethod.GET)
	public String paging(@RequestParam(value="page", required=false, defaultValue="1")int page, Model model) {
		PageDTO pDTO = bs.paging(page);
		List<BoardDTO> bList = bs.pagingList(page);
		model.addAttribute("bList", bList);
		model.addAttribute("pDTO", pDTO);
		
		return "board/findAll";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword, Model model) {
		List<BoardDTO> bList = bs.search(searchtype, keyword);
		model.addAttribute("bList", bList);
		
		return "board/findAll";
	}
}
