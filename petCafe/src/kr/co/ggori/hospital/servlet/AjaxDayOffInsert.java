package kr.co.ggori.hospital.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IDayoffMapper;
import kr.co.ggori.repository.vo.DayOffVO;

@WebServlet("/hospital/ajaxDayOffInsert")
public class AjaxDayOffInsert extends HttpServlet{
	private SqlSession session;
	private IDayoffMapper mapper;
	
	public AjaxDayOffInsert() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IDayoffMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=utf-8");
		System.out.println(request.getParameter("hospitalId"));
		System.out.println(request.getParameter("offDay"));
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		String offDay = request.getParameter("offDay");
		
		try {
			DayOffVO dayoff = new DayOffVO();
			dayoff.setHospitalId(hospitalId);
			dayoff.setOffDay(offDay);
			int result = mapper.insertDayoff(dayoff);
			session.commit();
			
//			List<DayOffVO> list = mapper.selectDayoffByHospitalId(hospitalId);
			PrintWriter out = response.getWriter();
			String json = "실패";
			if (result != 0) {
				json = "성공";
			}
			System.out.println(json.toString());
			out.println(json);
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
