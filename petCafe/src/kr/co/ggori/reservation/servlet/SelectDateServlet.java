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
import kr.co.ggori.repository.mapper.ICareTypeMapper;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.CareTypeVO;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/selectDate")
public class SelectDateServlet extends HttpServlet {

	SqlSession session = null;
	IReservationMapper reserMap = null;
	ICareTypeMapper careMap = null;
	
	public SelectDateServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
		careMap = session.getMapper(ICareTypeMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hospitalId = request.getParameter("hospitalId");
		List<ReservationVO> reservationList = null;
		List<CareTypeVO> careTypeList = null;

		try {
//			reservationList = reserMap.hospitalReservation( Integer.parseInt(hospitalId) );
			reservationList = reserMap.hospitalReservation(1);
			careTypeList = careMap.SearchCare(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("careTypeList", careTypeList);
//		request.setAttribute("hospitalId", hospitalId);
		request.setAttribute("hospitalId", 1);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
	}
}