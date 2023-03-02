package com.itwillbs.products.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.products.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;
import products.SalesDAO;

public class ProductAppointManagePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductAppointManagePro execute()");


		int ano=Integer.parseInt(request.getParameter("ano"));
	
		
		AppointmentDAO adao = new AppointmentDAO();
		adao.deleteAppointment(ano);
		
		SalesDAO sdao = new SalesDAO();
		sdao.deleteSales(ano);
		
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('숙소 예약이 취소됩니다.');");
		out.println("location.href='ProductAppointManage.pr'");
		out.println("</script>");
		out.close();
			

		return null;
	}

}
