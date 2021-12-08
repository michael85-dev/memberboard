package com.member.board.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.board.dto.BoardDTO;

@Repository
public class BoardRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void save(BoardDTO bDTO) {
		// TODO Auto-generated method stub
		sql.insert("Board.save", bDTO);
	}

	public List<BoardDTO> findAll() {
		// TODO Auto-generated method stub
		return sql.selectList("Board.findAll");
	}

	public BoardDTO detail(long b_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("Board.detail", b_number);
	}

	public void update(BoardDTO bDTO) {
		// TODO Auto-generated method stub
		sql.selectOne("Board.update", bDTO);
	}

	public void delete(long b_number) {
		// TODO Auto-generated method stub
		sql.selectOne("Board.delete", b_number);
	}

	public void hits(long b_number) {
		// TODO Auto-generated method stub
		sql.selectOne("Board.hits", b_number);
	}

	public int bCount() {
		// TODO Auto-generated method stub
		return sql.selectOne("Board.count");
	}

	public List<BoardDTO> pagingList1(Map<String, Integer> pagingParam) {
		// TODO Auto-generated method stub
		return sql.selectList("Board.pagingList1", pagingParam);
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		// TODO Auto-generated method stub
		return sql.selectList("Board.search", searchParam);
	}

}
