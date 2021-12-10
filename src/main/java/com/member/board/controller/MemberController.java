package com.member.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.member.board.dto.MemberDTO;
import com.member.board.service.MemberService;


@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="insertform", method=RequestMethod.GET)
	public String insertForm() {
		System.out.println("회원가입 페이지 요청됨(insertform");

		return "member/insert";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute MemberDTO mDTO) throws IllegalStateException, IOException {
		System.out.println("insert 데이터 전송됨");
		
		ms.insert(mDTO);	
	
		return "index";
	}
	
	@RequestMapping(value="loginform", method=RequestMethod.GET)
	public String loginForm(Model model) {
		System.out.println("login을 위한 form 요청됨");
		
		List<MemberDTO> mList = ms.findMember();

		List<String> name = new ArrayList<String>();
		for (int i = 0; i < mList.size(); i++) {
			name.add(mList.get(i).getM_id());
		}

		model.addAttribute("name", name);
		
		return "member/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO mDTO) {
		System.out.println("login 데이터 전송 요청 됨");
		
		MemberDTO member = ms.login(mDTO);
		
		if (member != null) {
			session.setAttribute("loginId", mDTO.getM_id());
			session.setAttribute("loginNumber", member.getM_number());
			
			return "main";
		} else {
			return "member/login";
		}
	}
	
	@RequestMapping(value="idDuplicate", method=RequestMethod.POST)
	public @ResponseBody String idDuplicate(@RequestParam("m_id") String m_id) {
		System.out.println("login.idDuplicate 함수 호출됨");
		
		String result = ms.idDuplicate(m_id);
		
		return result;
	}
	
	@RequestMapping(value="findMember", method=RequestMethod.GET)
	public String findMember(Model model) {
		List<MemberDTO> mList = ms.findMember();
		
		model.addAttribute("mList", mList);
		
		return "member/findMember";
	}
	
	@RequestMapping(value="detailAjax", method=RequestMethod.GET)
	public @ResponseBody MemberDTO detailAjax(@RequestParam("m_number") long m_number) {
		MemberDTO result = ms.detailAjax(m_number);
		
		return result;
	}
	
	/*
	 * @RequestMapping(value="check", method=RequestMethod.POST) public
	 * List<MemberDTO> check(@ModelAttribute MemberDTO mDTO) {
	 * System.out.println("Member.check()" + mDTO);
	 * 
	 * List<MemberDTO> mList = ms.findAll(mDTO.getM_number()); // 멤버 정보 가져오기
	 * 
	 * return mList; }
	 */
	
	@RequestMapping(value="updateform", method=RequestMethod.GET)
	public String updateForm(@RequestParam("m_number") long m_number, Model model) {
		MemberDTO mDTO = ms.detailAjax(m_number);
		model.addAttribute("mDTO", mDTO);
		
		return "member/update";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO mDTO) throws IllegalStateException, IOException {
		ms.update(mDTO);
		
		return "redirect:/member/findMember";
	}
	

}
