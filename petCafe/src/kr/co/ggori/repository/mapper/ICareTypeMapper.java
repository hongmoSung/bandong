package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.CareTypeVO;

public interface ICareTypeMapper {

	public List<CareTypeVO> SearchCare(int hospitalId) throws Exception;
	public int insertCare(CareTypeVO care) throws Exception;
	public int deleteCare(int careTypeId) throws Exception;
}