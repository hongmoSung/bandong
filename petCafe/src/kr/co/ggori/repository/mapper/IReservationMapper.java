package kr.co.ggori.repository.mapper;

import kr.co.ggori.repository.vo.ReservationVO;

public interface IReservationMapper {
	
	public ReservationVO myReservation(String memberId) throws Exception;
	public ReservationVO hospitalReservation(int hospitalId) throws Exception;
	public void insertReservation(ReservationVO reservation) throws Exception;
	public void deleteReservation(int reserId) throws Exception;
	public void updateReservation(ReservationVO reservation) throws Exception;

}