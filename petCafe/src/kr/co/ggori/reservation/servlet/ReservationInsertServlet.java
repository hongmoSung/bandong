package kr.co.ggori.reservation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IReservationMapper;

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
		
		
		
	}
	
}