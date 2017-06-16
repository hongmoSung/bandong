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

@WebServlet("/hospital/careDelete")
public class CareDelete extends HttpServlet{
	private SqlSession session;
	private ICareTypeMapper mapper;
	
	public CareDelete () {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(ICareTypeMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("진료삭제 서블릿");
		int careTypeId = Integer.parseInt(request.getParameter("careTypeId"));
		int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
		System.out.println(careTypeId);
		System.out.println(hospitalId);
		try {
			int result = mapper.deleteCare(careTypeId);
			if(result == 1) session.commit();
			request.setAttribute("hospitalId", hospitalId);
//			RequestDispatcher rd = request.getRequestDispatcher("ajaxCareInsert");
			RequestDispatcher rd = request.getRequestDispatcher("detail");
			rd.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
