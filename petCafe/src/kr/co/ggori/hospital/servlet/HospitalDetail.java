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
import kr.co.ggori.repository.mapper.ICareTypeMapper;
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.vo.CareTypeVO;
import kr.co.ggori.repository.vo.HospitalVO;

@WebServlet("/hospital/detail")
public class HospitalDetail extends HttpServlet{
	private SqlSession session;
	private IHospitalMapper mapper;
	private ICareTypeMapper cmapper;
	
	public HospitalDetail() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IHospitalMapper.class);
		this.cmapper = session.getMapper(ICareTypeMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		HospitalVO hospital = new HospitalVO();
		RequestDispatcher rd = null;
		
		try {
			hospital = mapper.selectHospitalById(hospitalId);
			List<CareTypeVO> careList = cmapper.SearchCare(hospitalId); 
			
			if (hospital != null) {
				request.setAttribute("hospital", hospital);
				request.setAttribute("careList", careList);
				rd = request.getRequestDispatcher("/view/hospital/detailForm.jsp");
				rd.forward(request, response);
			} else {
				rd = request.getRequestDispatcher("/hospital/hospitalInfo");
				rd.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
