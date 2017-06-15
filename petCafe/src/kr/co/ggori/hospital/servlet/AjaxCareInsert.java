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
		response.setContentType("text/html; charset=utf-8");
		String result = request.getParameter("result");
		String hospitalId = request.getParameter("hospitalId");
		String typeName = request.getParameter("typeName");
		String idNum = request.getParameter("idNum");
		
		try {
			CareTypeVO vo = new CareTypeVO();
			vo.setHospitalId(Integer.parseInt(hospitalId));
			vo.setTypeName(typeName);
			int db = mapper.insertCare(vo);
			if(db == 1) session.commit();
//			List<CareTypeVO> list = mapper.SearchCare(Integer.parseInt(hospitalId));
			PrintWriter out = response.getWriter();
			String resultHtml = "";
			
			if(result != null) {
				resultHtml += result;
			}
//			resultHtml = "[";
//			for(int i = 0; i < list.size(); i++) {
//				resultHtml += list.get(i).toString();
//				if (i != list.size() - 1) {
//					resultHtml += ",";
//				}
//			}
//			resultHtml += "]";
			resultHtml += //"<input type='hidden' value='" + hospitalId + "' name='hospitalId' id='hospitalId" + idNum + "'/>"
//				        + "<input type='hidden' value='" + careTypeId + "' name='careTypeId' id='careTypeId" + idNum + "'/>"
				         "<p id='" + idNum + "'><input type='text' value='" + typeName + "' name='typeName'/><button onclick='deleteBtn(" + idNum + ");'>삭제</button></p>";
			out.println(resultHtml);
			out.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
