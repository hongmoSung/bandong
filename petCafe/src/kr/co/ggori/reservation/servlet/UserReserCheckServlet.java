package kr.co.ggori.reservation.servlet;

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
import kr.co.ggori.repository.mapper.IReservationMapper;
import kr.co.ggori.repository.vo.CareTypeVO;
import kr.co.ggori.repository.vo.ReservationVO;

@WebServlet("/reservation/userReserCheck")
public class UserReserCheckServlet extends HttpServlet {

	SqlSession session = null;
	IReservationMapper reserMap = null;
	ICareTypeMapper careMap = null;
	
	public UserReserCheckServlet() {
		session = MyAppSqlConfig.getSqlSessionInstance();
		reserMap = session.getMapper(IReservationMapper.class);
		careMap = session.getMapper(ICareTypeMapper.class);
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		ReservationVO reser = new ReservationVO();
		List<ReservationVO> reserList = null;
		List<CareTypeVO> careList = null;
		
		try {
			reser = reserMap.userSelectReservation( Integer.parseInt(request.getParameter("reserId")) );
			reserList = reserMap.hospitalReservation( reser.getHospitalId() );
			careList = careMap.SearchCare( reser.getHospitalId() );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String inputReserFormText = "예약 시간 : <select name='reserTime' id='reserSelect'>";
		boolean check = false;
		for(int i = 10; i <= 18; i++) {
			check = false;
			for(int index = 0; index < reserList.size(); index++) {
				if( Integer.parseInt(reser.getReserTime().substring(0, 2)) == i ) {
					inputReserFormText += "<option value='" + i + "' selected>" + i + "</option>";
					check = true;
					break;
				}
				if( reserList.get(index).getReserDate().equals(reser.getReserDate()) ) {
					if( Integer.parseInt(reserList.get(index).getReserTime().substring(0, 2)) == i ) {
						check = true;
						break;
					}
				}
			}
			if(!check) {
				inputReserFormText += "<option value='" + i + "'>" + i + "</option>";
			}
		}
		inputReserFormText += "</select>시<br>";
		
		inputReserFormText += "진료 분야 : <select name='careType'>";
		for(int index = 0; index < careList.size(); index++) {
			inputReserFormText += "<option value='" + careList.get(index).getCareTypeId() + "'>" + careList.get(index).getTypeName() + "</option>";
		}
		inputReserFormText += "</select><br>";
		
		inputReserFormText += "예약자 이름 : <input type='text' name='reserName' value='" + reser.getReserName() + "' onkeyup='validTest();'/><br>";
		
		inputReserFormText += "상세 내용 : <textarea rows='5' cols='60' name='detail' style='resize: none;'>";
		if(reser.getDetail() != null) {
			inputReserFormText += reser.getDetail();
		}
		inputReserFormText += "</textarea><br>";
		
		PrintWriter out = response.getWriter();
		out.println(inputReserFormText);
		out.close();
	}
	
}