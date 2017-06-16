package kr.co.ggori.reservation.servlet;

import java.io.IOException;
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
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.CareTypeVO;
import kr.co.ggori.repository.vo.DayOffVO;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/selectDate")
public class SelectDateServlet extends HttpServlet {

	private SqlSession session = null;
	private IReservationMapper reserMap = null;
	private ICareTypeMapper careMap = null;
	private IHospitalMapper hospitalMap = null;
	
	public SelectDateServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
		careMap = session.getMapper(ICareTypeMapper.class);
		hospitalMap = session.getMapper(IHospitalMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hospitalId = request.getParameter("hospitalId");
		List<ReservationVO> reservationList = null;
		List<CareTypeVO> careTypeList = null;
		
		List<DayOffVO> hospitalDayOff = null;

		System.out.println("hospital Id : " + hospitalId);
		
		try {
			reservationList = reserMap.hospitalReservation( Integer.parseInt(hospitalId) );
			careTypeList = careMap.SearchCare( Integer.parseInt(hospitalId) );
			hospitalDayOff = reserMap.hospitalDayOff( Integer.parseInt(hospitalId) );
			
			for(int i = 0, len = hospitalDayOff.size(); i < len; i++) {
				hospitalDayOff.get(i).setName( hospitalMap.selectHospitalById(hospitalDayOff.get(i).getHospitalId()).getName() );
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("careTypeList", careTypeList);
		request.setAttribute("hospitalId", hospitalId);
		request.setAttribute("hospitalDayOff", hospitalDayOff);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/reservation/selectDate.jsp");
		rd.forward(request, response);
	}
}