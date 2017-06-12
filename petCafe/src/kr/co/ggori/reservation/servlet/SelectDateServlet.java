package kr.co.ggori.reservation.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/selectDate")
public class SelectDateServlet extends HttpServlet {

	SqlSession session = null;
	IReservationMapper reserMap = null;
	
	public SelectDateServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hospitalId = request.getParameter("hospitalId");
		List<ReservationVO> reservationList = null;
		//------------------------------
		try {
			reservationList = reserMap.hospitalReservation(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		reservationlist = new ArrayList<>();
		ReservationVO reser = new ReservationVO();
		
		reser.setReserId(1);
		reser.setReserDate("2017-06-15");
		reser.setReserTime("11:00:00");
		reservationlist.add(reser);
	
		ReservationVO reser2 = new ReservationVO();
		reser2.setReserId(2);
		reser2.setReserDate("2017-06-17");
		reser2.setReserTime("12:00:00");
		reservationlist.add(reser2);
		
		ReservationVO reser3 = new ReservationVO();
		reser3.setReserId(3);
		reser3.setReserDate("2017-06-19");
		reser3.setReserTime("13:00:00");
		reservationlist.add(reser3);
		
		ReservationVO reser4 = new ReservationVO();
		reser4.setReserId(4);
		reser4.setReserDate("2017-06-17");
		reser4.setReserTime("13:00:00");
		reservationlist.add(reser4);

		ReservationVO reser5 = new ReservationVO();
		reser5.setReserId(5);
		reser5.setReserDate("2017-06-22");
		reser5.setReserTime("13:00:00");
		reservationlist.add(reser5);

		ReservationVO reser6 = new ReservationVO();
		reser6.setReserId(6);
		reser6.setReserDate("2017-06-27");
		reser6.setReserTime("13:00:00");
		reservationlist.add(reser6);
		*/
		//------------------------------
		try {
//			list = reserMap.hospitalReservation( Integer.parseInt(hospitalId) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("hospitalId", hospitalId);
		request.setAttribute("test", "test입니다");
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
	}
}