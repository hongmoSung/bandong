package kr.co.ggori.reservation.servlet;

import java.io.IOException;

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

@WebServlet("/reservation/reserUpdate")
public class ReserUpdateServlet extends HttpServlet {

	private SqlSession session = null;
	private IReservationMapper reserMap = null;
	
	public ReserUpdateServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReservationVO reservation = new ReservationVO();
		
		reservation.setReserDate( request.getParameter("reserDate") );
		reservation.setReserTime( request.getParameter("reserTime") + ":00:00" );
		reservation.setCareTypeId( request.getParameter("careType") );
		reservation.setReserName( request.getParameter("reserName") );
		if( request.getParameter("reserName") != "" ) {
			reservation.setDetail( request.getParameter("detail") );
		}
		
		try {
			reserMap.updateReservation(reservation);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/main/Main");
		rd.forward(request, response);
		
	}
	
}