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
		response.setContentType("text/html; charset=utf-8");
		
		String result = request.getParameter("result");
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		String offDay = request.getParameter("offDay");
		String idNum = request.getParameter("idNum");
		
		try {
			DayOffVO dayoff = new DayOffVO();
			dayoff.setHospitalId(hospitalId);
			dayoff.setOffDay(offDay);
			
			PrintWriter out = response.getWriter();
			String resultHtml = "";
			
			if (result != null) {
				resultHtml += result;
			}
			
			resultHtml += "<p id='" + idNum + "'><input type='text' value='" + offDay + "'/><button onclick='deleteBtn2(" + idNum + ");'>삭제</button></p>";
			
			out.println(resultHtml);
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
