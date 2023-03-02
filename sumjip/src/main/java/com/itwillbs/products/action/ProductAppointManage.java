package com.itwillbs.products.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.products.action.ActionForward;

import member.UserDAO;
import member.UserDTO;
import products.AppointmentDAO;
import products.AppointmentDTO;
import products.ProductDAO;
import products.ProductDTO;
import products.SalesDAO;
import products.SalesDTO;

public class ProductAppointManage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductAppointManage execute()");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		UserDAO dao=new UserDAO();
	 	UserDTO dto=dao.getUser(id);

	 	int no=dto.getNo();
	 	int pageSize=10;
	     
	 	String pageNum=request.getParameter("pageNum");
	 	if(pageNum==null){	 	
	 	pageNum="1";
	 	}
	 	int currentPage=Integer.parseInt(pageNum);
	 	int startRow=(currentPage-1)*pageSize+1;

	 	int endRow = startRow+pageSize-1;
	 	
	 	AppointmentDAO adao = new AppointmentDAO();
	 	ArrayList<AppointmentDTO> AppointmentList = adao.getAppointmentList(no, startRow, pageSize);
	 	
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int count = adao.getAppointmentCount(no);
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
			

		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("dto", dto);
 		request.setAttribute("AppointmentList", AppointmentList);

 		ActionForward forward=new ActionForward();
		forward.setPath("products/appointManage.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
