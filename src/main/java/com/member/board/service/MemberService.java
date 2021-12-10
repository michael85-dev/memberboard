package com.member.board.service;

import java.io.IOException;
import java.util.List;

import com.member.board.dto.MemberDTO;

public interface MemberService {

	void insert(MemberDTO mDTO) throws IllegalStateException, IOException;

	String idDuplicate(String m_id);

	MemberDTO login(MemberDTO mDTO);

	List<MemberDTO> findMember();

	MemberDTO detailAjax(long m_number);

	List<MemberDTO> findAll(long m_number);

	void update(MemberDTO mDTO) throws IllegalStateException, IOException;

}
