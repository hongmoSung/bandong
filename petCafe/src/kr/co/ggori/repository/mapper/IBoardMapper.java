package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.BoardVO;

public interface IBoardMapper {
	public List<BoardVO> selectAll() throws Exception;
}
