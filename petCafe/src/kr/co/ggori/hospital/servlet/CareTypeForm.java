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

@WebServlet("/hospital/CareTypeForm")
public class CareTypeForm extends HttpServlet{
	private SqlSession session;
	private IHospitalMapper hmapper;
	
	public CareTypeForm() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.hmapper = session.getMapper(IHospitalMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hospitalId = request.getParameter("hospitalId");
		System.out.println(hospitalId);
		request.setAttribute("hospitalId", hospitalId);
		
		try {
			HospitalVO hospital = new HospitalVO();
			hospital = hmapper.selectHospitalById(Integer.parseInt(hospitalId));
			request.setAttribute("hospital", hospital);
			RequestDispatcher rd = request.getRequestDispatcher("/view/hospital/careTypeForm.jsp");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
