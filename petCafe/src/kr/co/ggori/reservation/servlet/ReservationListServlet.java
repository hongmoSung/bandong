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
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.HospitalVO;
import kr.co.ggori.repository.vo.MemberVO;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/reservationList")
public class ReservationListServlet extends HttpServlet {

	SqlSession session = null;
	IReservationMapper reserMap = null;
	IHospitalMapper hospitalMap = null;

	public ReservationListServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
		hospitalMap = session.getMapper(IHospitalMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hSession = request.getSession();
		MemberVO member = (MemberVO)hSession.getAttribute("member");
		List<HospitalVO> hospitalList = new ArrayList<>();
		
		List<ReservationVO> reserList = null; 
		
		try {
			reserList = reserMap.myReservation(member.getMemberId());
			for(int i = 0; i < reserList.size(); i++)
				hospitalList.add( hospitalMap.selectHospitalById(reserList.get(i).getHospitalId()) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("reserList", reserList);
		request.setAttribute("hospitalList", hospitalList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/reservationList.jsp");
		rd.forward(request, response);
		
	}
	
}