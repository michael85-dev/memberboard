package com.member.board.service;

import java.io.IOException;
import java.util.List;

import com.member.board.dto.BoardDTO;
import com.member.board.dto.PageDTO;

public interface BoardService{

	void save(BoardDTO bDTO) throws IllegalStateException, IOException;

	List<BoardDTO> findAll();

	BoardDTO detail(long b_number);

	void update(BoardDTO bDTO) throws IllegalStateException, IOException;

	void delete(long b_number);

	PageDTO paging(int page);

	List<BoardDTO> pagingList(int page);

	List<BoardDTO> search(String searchtype, String keyword);

}
