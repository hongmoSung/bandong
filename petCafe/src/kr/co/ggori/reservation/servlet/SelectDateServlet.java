package kr.co.ggori.reservation.servlet;

import java.io.IOException;
import java.util.List;

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
		List<ReservationVO> list = null;
		
		try {
			list = reserMap.hospitalReservation( Integer.parseInt(hospitalId) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
	}
}