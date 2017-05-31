package kr.co.ggori.repository.mapper;

import kr.co.ggori.repository.vo.MemberVO;

public interface IMemberMapper {
	
	public int insertMember(MemberVO member) throws Exception;
	public MemberVO selectMemberOne(MemberVO member) throws Exception;
}
