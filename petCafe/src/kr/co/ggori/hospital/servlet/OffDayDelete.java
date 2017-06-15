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
import kr.co.ggori.repository.mapper.IDayoffMapper;

@WebServlet("/hospital/offDayDelete")
public class OffDayDelete extends HttpServlet{
	private SqlSession session;
	private IDayoffMapper mapper;
	
	public OffDayDelete() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IDayoffMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("dayoffId"));
		System.out.println(request.getParameter("hospitalId"));
		int dayoffId = Integer.parseInt(request.getParameter("dayoffId"));
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		
		try {
			int result = mapper.deleteDayoff(dayoffId);
			
			if(result == 1) session.commit();
			request.setAttribute("hospitalId", hospitalId);
			RequestDispatcher rd = request.getRequestDispatcher("detail");
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
