package com.member.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.member.board.dto.MemberDTO;
import com.member.board.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberRepository mr;
	
	@Override
	public void insert(MemberDTO mDTO) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		// 프로필 작업 관련 한 명령어
		MultipartFile m_photo = mDTO.getM_photo();
		String m_photoname = m_photo.getOriginalFilename(); // 파일명 중복을 피하기 위해서 파일명 명명
				
		m_photoname= System.currentTimeMillis() + "-" + m_photoname;
		System.out.println("m_photoname : " + m_photoname);
				
		// 파일 저장
		String savePath = "D:\\github\\memberboard\\src\\main\\webapp\\resources\\upload" + m_photoname;
				
		if (!m_photo.isEmpty()) {
			m_photo.transferTo(new File(savePath));
		} // 파일 저장 과정
				
		mDTO.setM_photoname(m_photoname);
				
		mr.insert(mDTO);
	}

	@Override
	public String idDuplicate(String m_id) {
		// TODO Auto-generated method stub
		String result = mr.idDuplicate(m_id);
		
		if (result == null) {
			result = "no";
		} else {
			result = "ok";
		}
		
		return result;
	}

	@Override
	public MemberDTO login(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		return mr.login(mDTO);
	}

	@Override
	public List<MemberDTO> findMember() {
		// TODO Auto-generated method stub
		return mr.findMember();
	}

	@Override
	public MemberDTO detailAjax(long m_number) {
		// TODO Auto-generated method stub
		return mr.detailAjax(m_number);
	}

}
