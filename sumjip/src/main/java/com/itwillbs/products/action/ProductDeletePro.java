package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import products.ProductDAO;

public class ProductDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductDeletePro exectute()");
		
		int pno=Integer.parseInt(request.getParameter("pno"));

		ProductDAO dao=new ProductDAO();

		dao.deleteProduct(pno);

		ActionForward forward=new ActionForward();
		forward.setPath("ProductList.pr");
		forward.setRedirect(true);
		return forward;
	}


}
