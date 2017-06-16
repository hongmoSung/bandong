package kr.co.ggori.hospital.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.vo.HospitalVO;

@WebServlet("/hospital/join")
public class HospitalJoin extends HttpServlet{
	private SqlSession session;
	private IHospitalMapper mapper;
	
	public HospitalJoin() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IHospitalMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HospitalVO hospital = new HospitalVO();
		hospital.setName(request.getParameter("name"));
		hospital.setTelNumber(Integer.parseInt(request.getParameter("telNumber")));
		hospital.setAddress(request.getParameter("address"));
		hospital.setLatitude(request.getParameter("latitude"));
		hospital.setLongitude(request.getParameter("longitude"));
		hospital.setMemberId(request.getParameter("memberId"));
		
		System.out.println(hospital.toString());
		String msg = "실패";
		try {
			int result = mapper.insertHospital(hospital);
			if (result != 0) {
				session.commit();
				msg = "성공";
//				RequestDispatcher rd = request.getRequestDispatcher("/hospital/hospitalInfo");
				RequestDispatcher rd = request.getRequestDispatcher("/hospital/joinForm");
				request.setAttribute("msg", msg);
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/hospital/joinForm");
				request.setAttribute("msg", msg);
				rd.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
