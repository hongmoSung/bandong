package kr.co.ggori.hospital.servlet;

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
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.vo.HospitalVO;

@WebServlet("/hospital/hospitalList")
public class HospitalList extends HttpServlet{
	private SqlSession session;
	private IHospitalMapper mapper;
	
	public HospitalList() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IHospitalMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<HospitalVO> hospitals = mapper.selectHospitalList();
			request.setAttribute("hospitals", hospitals);
			RequestDispatcher rd = request.getRequestDispatcher("/view/hospital/totalHospital.jsp");
			rd.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
