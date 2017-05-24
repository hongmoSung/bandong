package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.BoardVO;


public interface IMainMapper {
	public List<BoardVO> recentBoard(String boardType);
}