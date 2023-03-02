package com.itwillbs.products.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import products.AppointmentDAO;
import products.AppointmentDTO;
import products.OwnerAppointmentDTO;

public class ProductOwnerAppointManage implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ProductOwnerAppointManage execute()");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		UserDAO dao=new UserDAO();
	 	UserDTO udto=dao.getUser(id);

	 	int no=udto.getNo();
	 	int pageSize=10;
	     
	 	String pageNum=request.getParameter("pageNum");
	 	if(pageNum==null){	 	
	 	pageNum="1";
	 	}
	 	int currentPage=Integer.parseInt(pageNum);
	 	int startRow=(currentPage-1)*pageSize+1;

	 	int endRow = startRow+pageSize-1;
	 	
	 	AppointmentDAO adao = new AppointmentDAO();
	 	ArrayList<OwnerAppointmentDTO> OwnerAppointmentList = adao.getownerAppointmentList(no, startRow, pageSize);
	 	
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int count = OwnerAppointmentList.size();
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
			
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("udto", udto);
 		request.setAttribute("OwnerAppointmentList", OwnerAppointmentList);

 		ActionForward forward=new ActionForward();
		forward.setPath("products/OwnerAppointManage.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
