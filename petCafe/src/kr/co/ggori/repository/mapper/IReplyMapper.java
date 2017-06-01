package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.BoardVO;

public interface IReplyMapper {
	
	public void insertReply(BoardVO board) throws Exception;
	public int updateReply(BoardVO board) throws Exception;
	public int deleteReply(int no) throws Exception;
	public List<BoardVO> selectReply() throws Exception;

}
