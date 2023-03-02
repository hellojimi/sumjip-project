package com.itwillbs.products.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import products.ProductDAO;
import products.ProductDTO;

public class ProductAppointment implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductAppointment execute()");
		HttpSession session = request.getSession();
		
		String id=(String)session.getAttribute("id");
		ActionForward forward = null;
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('로그인 후에 예약하실수 있습니다.');");
			out.println("location.href='MemberLogin.me';");
			out.println("</script>");
			out.close();	
		}else {
			
			
			
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(pno);
		
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		
		
		request.setAttribute("pdto", pdto);
		request.setAttribute("udto", udto);
		
		
		forward = new ActionForward();
		forward.setPath("products/appointment.jsp");
		forward.setRedirect(false);
		
		}
		return forward;
	}

}
