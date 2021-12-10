package com.member.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.board.dto.CommentDTO;
import com.member.board.repository.CommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentRepository cr;
	
	@Override
	public void save(CommentDTO cDTO) {
		// TODO Auto-generated method stub
		cr.save(cDTO);
	}

	@Override
	public List<CommentDTO> findAll(long b_number) {
		// TODO Auto-generated method stub
		return cr.findAll(b_number);
	}

	@Override
	public List<CommentDTO> count(long b_number) {
		// TODO Auto-generated method stub
		System.out.println(cr.count(b_number));
		
		return cr.count(b_number);
	}

}
