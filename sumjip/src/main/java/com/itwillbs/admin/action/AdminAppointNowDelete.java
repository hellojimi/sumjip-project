package com.itwillbs.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;

public class AdminAppointNowDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAppointNowDelete execute()");
		
		int num=Integer.parseInt(request.getParameter("num"));
		AppointmentDAO dao=new AppointmentDAO();
		AppointmentDTO dto=dao.AppointmentCheck(num);
		// AppointmentDTO dto=(AppointmentDTO)request.getAttribute("dto");
		if(dto != null){
			// id,pass 일치
			// 리턴값없음 deleteMember(String id) 메서드 정의 
			// dao.deleteMember(id) 메서드 호출
			dao.deleteAppointment(num);
			// => 세션값 초기화
//		 	session.invalidate();		
			// => main.jsp 이동
//			response.sendRedirect("AdminAppointNow.ad");
		}
		
		ActionForward forward=new ActionForward();
		forward.setPath("AdminAppointNow.ad");
		forward.setRedirect(true);
		return forward;
	}
	
}
