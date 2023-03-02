package com.itwillbs.products.action;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import products.ProductDAO;
import products.ProductDTO;

public class ProductList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductList execute()");
		
		 HttpSession session = request.getSession();
		 String id = (String)session.getAttribute("id");
		
		 ProductDAO dao= new ProductDAO();
		 int pageSize=10;
		 String pageNum=request.getParameter("pageNum");
		 if(pageNum==null){
		 	 pageNum="1";
		 	}

		 int currentPage=Integer.parseInt(pageNum);
		 int startRow=(currentPage-1)*pageSize+1;
		 int endRow= startRow+pageSize-1;

		 ArrayList<ProductDTO> productList1=dao.getProductList(startRow, pageSize, id);

		 int pageBlock=10;
		 int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		 int endPage=startPage+pageBlock-1;
		 int count = productList1.size();
		 int pageCount=count/pageSize+(count%pageSize==0?0:1);
		 if(endPage > pageCount){
			 endPage = pageCount;
		 }		
		 
		 request.setAttribute("productList1", productList1);
		 request.setAttribute("currentPage", currentPage);
		 request.setAttribute("pageBlock", pageBlock);
		 request.setAttribute("startPage", startPage);
		 request.setAttribute("endPage", endPage);
		 request.setAttribute("pageCount", pageCount);
			System.out.println(productList1.size());
			
		 // 이동
		 ActionForward forward = new ActionForward();
		 forward.setPath("products/productList.jsp");
		 forward.setRedirect(false);
			
		 return forward;
	}

}
