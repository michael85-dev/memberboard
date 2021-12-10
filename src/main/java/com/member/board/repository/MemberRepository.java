package com.member.board.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.board.dto.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSessionTemplate sql;
	
	public void insert(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		sql.insert("Member.insert", mDTO);
	}

	public String idDuplicate(String m_id) {
		// TODO Auto-generated method stub
		return sql.selectOne("Member.idDuplicate", m_id);
	}

	public MemberDTO login(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		return sql.selectOne("Member.login", mDTO);
	}

	public List<MemberDTO> findMember() {
		// TODO Auto-generated method stub
		return sql.selectList("Member.findMember");
	}

	public MemberDTO detailAjax(long m_number) {
		// TODO Auto-generated method stub
		return sql.selectOne("Member.detailAjax", m_number);
	}

	public List<MemberDTO> findAll(long m_number) {
		// TODO Auto-generated method stub
		return sql.selectList("Member.check", m_number);
	}

	public void update(MemberDTO mDTO) {
		// TODO Auto-generated method stub
		sql.selectOne("Member.update", mDTO);
	}

}
