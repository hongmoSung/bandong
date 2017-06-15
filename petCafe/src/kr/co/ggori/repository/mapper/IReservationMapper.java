package kr.co.ggori.repository.mapper;

import java.util.List;

import kr.co.ggori.repository.vo.DayOffVO;
import kr.co.ggori.repository.vo.ReservationVO;

public interface IReservationMapper {
	
	public List<ReservationVO> myReservation(String memberId) throws Exception;
	public List<ReservationVO> hospitalReservation(int hospitalId) throws Exception;
	public void insertReservation(ReservationVO reservation) throws Exception;
	public void insertReservationNoDetail(ReservationVO reservation) throws Exception;
	public void deleteReservation(int reserId) throws Exception;
	public void updateReservation(ReservationVO reservation) throws Exception;
	public void updateReservationNoDetail(ReservationVO reservation) throws Exception;
	public List<DayOffVO> hospitalDayOff(int hospitalId) throws Exception;
	public ReservationVO userSelectReservation(int reserId) throws Exception;

}