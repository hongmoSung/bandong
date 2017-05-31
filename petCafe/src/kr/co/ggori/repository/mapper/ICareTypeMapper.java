package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.CareTypeVO;

public interface ICareTypeMapper {

	public List<String> SearchCare(int hospitalId);
	public void insertCare(CareTypeVO care);
	
}