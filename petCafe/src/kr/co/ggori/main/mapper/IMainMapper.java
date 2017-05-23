package kr.co.ggori.main.mapper;

import java.util.List;

import kr.co.ggori.board.vo.BoardVO;

public interface IMainMapper {
	public List<BoardVO> recentBoard(String boardType);
}