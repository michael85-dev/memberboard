package com.member.board.service;

import java.util.List;

import com.member.board.dto.CommentDTO;

public interface CommentService {

	void save(CommentDTO cDTO);

	List<CommentDTO> findAll(long b_number);

	List<CommentDTO> count(long b_number);

}
