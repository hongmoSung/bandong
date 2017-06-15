package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.DayOffVO;

public interface IDayoffMapper {
	public List<DayOffVO> selectAllDayoff() throws Exception;
	public List<DayOffVO> selectDayoffByHospitalId(int hospitalId) throws Exception;
	public int insertDayoff(DayOffVO dayoff) throws Exception;
	public int deleteDayoff(int dayoffId) throws Exception;
}
