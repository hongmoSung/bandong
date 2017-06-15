package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.MemberVO;

public interface IMemberMapper {
	
	public int insertMember(MemberVO member) throws Exception;
	public MemberVO selectMemberOne(MemberVO member) throws Exception;
//	public String selectMemberByEmail(String email) throws Exception;
	public List<MemberVO> selectMemberAll () throws Exception;
	public List<MemberVO> selectMemberByEmail(String email) throws Exception;
	public int updateMemberPass(MemberVO member) throws Exception;
	public int updateMember(MemberVO member) throws Exception;
	public int updateMemberRank(MemberVO member) throws Exception;
}
