package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import products.ProductDAO;
import products.ProductDTO;

public class ProductUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductUpdateForm execute()");
		
		int pno=Integer.parseInt(request.getParameter("pno"));

		ProductDAO dao=new ProductDAO();

		ProductDTO dto=dao.getProduct(pno);
		
		request.setAttribute("dto", dto);

		ActionForward forward=new ActionForward();
		forward.setPath("products/productupdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
