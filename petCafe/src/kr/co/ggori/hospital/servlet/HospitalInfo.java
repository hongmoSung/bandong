package kr.co.ggori.hospital.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.db.MyAppSqlConfig;
import kr.co.ggori.repository.mapper.IHospitalMapper;
import kr.co.ggori.repository.vo.HospitalVO;
import kr.co.ggori.repository.vo.MemberVO;

@WebServlet("/hospital/hospitalInfo")
public class HospitalInfo extends HttpServlet{
	private SqlSession session;
	private IHospitalMapper mapper;
	
	public HospitalInfo () {
		session = MyAppSqlConfig.getSqlSessionInstance();
		this.mapper = session.getMapper(IHospitalMapper.class);
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		MemberVO member = (MemberVO)s.getAttribute("member");
		String memberId = member.getMemberId();
		
		try {
			List<HospitalVO> hospitals = mapper.selectHospital(memberId);
//			List<HospitalVO> hospitals = mapper.selectHospital(memberId);
			request.setAttribute("hospitals", hospitals);
			
			if (hospitals != null) {
//				RequestDispatcher rd = request.getRequestDispatcher("/view/hospital/hospitalInfo.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("/view/hospital/MyHospital.jsp");
				rd.forward(request, response);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
