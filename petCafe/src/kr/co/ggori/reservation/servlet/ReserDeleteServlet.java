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

@WebServlet("/reservation/reserDelete")
public class ReserDeleteServlet extends HttpServlet {
	
	private SqlSession session = null;
	private IReservationMapper reserMap = null;

	public ReserDeleteServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int reserId = Integer.parseInt( request.getParameter("reserId") );
		
		try {
			reserMap.deleteReservation(reserId);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/main/Main");
		rd.forward(request, response);
		
	}
	
}