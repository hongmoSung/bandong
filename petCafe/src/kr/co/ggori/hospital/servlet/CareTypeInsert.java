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
import kr.co.ggori.repository.mapper.ICareTypeMapper;
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.vo.CareTypeVO;
import kr.co.ggori.repository.vo.HospitalVO;

@WebServlet("/hospital/careTypeInsert")
public class CareTypeInsert extends HttpServlet{
	private SqlSession session;
	private ICareTypeMapper mapper;
//	private IHospitalMapper hmapper;
	
	public CareTypeInsert() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(ICareTypeMapper.class);
//		this.hmapper = session.getMapper(IHospitalMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CareTypeVO careType = new CareTypeVO();
		careType.setTypeName(request.getParameter("typeName"));
		careType.setHospitalId(Integer.parseInt(request.getParameter("hospitalId")));
		
		RequestDispatcher rd = null;
		String msg = "실패";
		
		try {
			int result = mapper.insertCare(careType);
//			HospitalVO hospital = new HospitalVO();
//			hospital = hmapper.selectHospitalById(careType.getHospitalId());
//			System.out.println(hospital.toString());
			
			if(result != 0) {
				session.commit();
				msg = "성공";
				request.setAttribute("msg", msg);
//				request.setAttribute("hospital", hospital);
				rd = request.getRequestDispatcher("/hospital/CareTypeForm");
				rd.forward(request, response);
				
			} else {
				request.setAttribute("msg", msg);
				rd = request.getRequestDispatcher("/hospital/CareTypeForm");
				rd.forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
