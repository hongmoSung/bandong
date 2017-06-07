package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.HospitalVO;

public interface IHospitalMapper {
	
	public int insertHospital(HospitalVO hospital) throws Exception;
	public void updateHospital(HospitalVO hospital) throws Exception;
	public void deleteHospital(int delId) throws Exception;
	public List<HospitalVO> searchHospital(HospitalVO hospital) throws Exception;
	public HospitalVO selectHospital(String memberId) throws Exception;
}