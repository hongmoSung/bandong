package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.BoardVO;
import kr.co.ggori.repository.vo.FileVO;

public interface IBoardMapper {
	public List<BoardVO> selectAll(String boardType) throws Exception;
	public String myNickName(String memberId) throws Exception;
	public BoardVO selectOneBoard(int boardNo) throws Exception;
	public int updateBoard(BoardVO board) throws Exception;
	public int deleteBoard(int boardNo) throws Exception;
	public int insertBoard(BoardVO board) throws Exception;

	
	
	
	
	public FileVO selectFile(int boardNo) throws Exception;
	public int insertFile(FileVO file) throws Exception;
	public int deleteFile(int boardNo) throws Exception;

}
