package kr.co.ggori.reservation.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.MemberVO;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/reserInsert")
public class ReservationInsertServlet extends HttpServlet {

	private IReservationMapper reserMap = null;
	private SqlSession session = null;
	
	public ReservationInsertServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession Hsession = request.getSession();
		
		ReservationVO reservation = new ReservationVO();
		
		String detail = request.getParameter("detail");
		MemberVO mem = (MemberVO)Hsession.getAttribute("member");
		String reserTime = request.getParameter("reserTime") + ":00:00";
		
		reservation.setReserDate( request.getParameter("userSelectDate") );
		reservation.setReserTime( reserTime );
		reservation.setReserName( request.getParameter("reserName") );
		reservation.setHospitalId( Integer.parseInt(request.getParameter("hospitalId")) );
		reservation.setMemberId( mem.getMemberId() );
		reservation.setCareTypeId( request.getParameter("careType") );
		
		try {
			if( detail != "" ) {
				reservation.setDetail( detail );
				reserMap.insertReservation(reservation);
			}
			else {
				reserMap.insertReservationNoDetail(reservation);
			}
			session.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/reservation/reservationList");
		rd.forward(request, response);
		
	}
	
}