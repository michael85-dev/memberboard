package com.member.board.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.member.board.dto.BoardDTO;
import com.member.board.dto.PageDTO;
import com.member.board.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository br;

	@Override
	public void save(BoardDTO bDTO) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		MultipartFile b_file = bDTO.getB_file();
		String b_filename = b_file.getOriginalFilename();
		
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename : " + b_filename);
		
		//파일 저장
		String savePath = "D:\\github\\memberboard\\src\\main\\webapp\\resources\\upload" + b_filename;
		
		if (!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		
		bDTO.setB_filename(b_filename);
		
		br.save(bDTO);
	}
	
	@Override
	public List<BoardDTO> findAll() {
		// TODO Auto-generated method stub
		return br.findAll();
	}

	@Override
	public BoardDTO detail(long b_number) {
		// TODO Auto-generated method stub
		br.hits(b_number);
		return br.detail(b_number);
	}

	@Override
	public void update(BoardDTO bDTO) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		MultipartFile b_file = bDTO.getB_file();
		String b_filename = b_file.getOriginalFilename();
		
		b_filename = System.currentTimeMillis() + "-" + b_filename;
		System.out.println("b_filename : " + b_filename);
		
		//파일 저장
		String savePath = "D:\\github\\memberboard\\src\\main\\webapp\\resources\\upload" + b_filename;
		
		if (!b_file.isEmpty()) {
			b_file.transferTo(new File(savePath));
		}
		
		bDTO.setB_filename(b_filename);
		
		br.update(bDTO);
	}

	@Override
	public void delete(long b_number) {
		// TODO Auto-generated method stub
		br.delete(b_number);
	}
	
	private static final int PAGE_LIMIT = 3; // 한페이지에 보여질 글 개수 
	private static final int BLOCK_LIMIT = 5; // 한화면에 보여질 페이지 개수

	@Override
	public PageDTO paging(int page) {
		// TODO Auto-generated method stub
		int bCount = br.bCount();
		int maxPage = (int)(Math.ceil((double)bCount / PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1);// 목록을 뿌릴때 댓글수를 가지고 오게?v;
		
		int endPage = startPage + BLOCK_LIMIT - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		System.out.println("paging.toString : " + paging.toString());
		
		return paging;
	}

	@Override
	public List<BoardDTO> pagingList(int page) {
		// TODO Auto-generated method stub
		int pagingStart = (page - 1) * PAGE_LIMIT;
		
		Map<String, Integer> pagingParam = new HashMap<String, Integer>();
		pagingParam.put("start", pagingStart);
		pagingParam.put("limit", PAGE_LIMIT);
		
		List<BoardDTO> pagingList = br.pagingList1(pagingParam);
		for(BoardDTO b: pagingList) {
			System.out.println(b.toString());
		}
		
		return pagingList;
	}

	@Override
	public List<BoardDTO> search(String searchtype, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("type", searchtype);
		searchParam.put("word", keyword);
		
		List<BoardDTO> bList = br.search(searchParam);
		
		return bList;
	}

}
