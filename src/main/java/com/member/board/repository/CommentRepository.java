package com.member.board.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.board.dto.CommentDTO;

@Repository
public class CommentRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void save(CommentDTO cDTO) {
		// TODO Auto-generated method stub
		sql.insert("Comment.save", cDTO);
	}

	public List<CommentDTO> findAll(long b_number) {
		// TODO Auto-generated method stub
		return sql.selectList("Comment.findAll", b_number);
	}

	public List<CommentDTO> count(long b_number) {
		// TODO Auto-generated method stub
		
		return sql.selectList("Comment.count", b_number);
	}

}
