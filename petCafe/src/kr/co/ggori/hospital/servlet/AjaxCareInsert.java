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
import kr.co.ggori.repository.mapper.ICareTypeMapper;
import kr.co.ggori.repository.vo.CareTypeVO;

@WebServlet("/hospital/ajaxCareInsert")
public class AjaxCareInsert extends HttpServlet{
	private SqlSession session;
	private ICareTypeMapper mapper;
	
	public AjaxCareInsert() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(ICareTypeMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain; charset=utf-8");
		System.out.println("ajax서블릿");
		System.out.println(request.getParameter("hospitalId"));
		System.out.println(request.getParameter("typeName"));
		
		String hospitalId = request.getParameter("hospitalId");
		String typeName = request.getParameter("typeName");
		
		try {
			CareTypeVO vo = new CareTypeVO();
			vo.setHospitalId(Integer.parseInt(hospitalId));
			vo.setTypeName(typeName);
			int result = mapper.insertCare(vo);
			session.commit();
			
			List<CareTypeVO> list = mapper.SearchCare(Integer.parseInt(hospitalId));
			PrintWriter out = response.getWriter();
//			String json = "";
			String json = "실패";
			if (result != 0) {
				json = "성공";
			}
//			json = "[";
//			for(int i = 0; i < list.size(); i++) {
//				json += list.get(i).toString();
//				if (i != list.size() - 1) {
//					json += ",";
//				}
//			}
//			json += "]";
			System.out.println(json.toString());
			out.println(json);
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
