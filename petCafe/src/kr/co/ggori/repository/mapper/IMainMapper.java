package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.MemberVO;


public interface IMainMapper {
	
	public List<BoardVO> recentBoard(String boardType) throws Exception;
	public String cafeMaster() throws Exception;
	public int cafeBoardCount() throws Exception;
	public int cafeMemberCount() throws Exception;
	public MemberVO myMiniInfo(String memberId) throws Exception;
	public int myMiniBoardCount(String memberId) throws Exception;
	public int myMiniReplyCount(String memberId) throws Exception;
	public List<String> boardList() throws Exception;
	public BoardVO search(BoardVO board) throws Exception;
	public String myNickName(String memberId) throws Exception;
	
}