package com.itwillbs.products.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.ReviewDAO;
import member.ReviewDTO;
import member.UserDTO;
import products.ProductDAO;
import products.ProductDTO;

public class ProductContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductContent execute()");
		
		int pno=Integer.parseInt(request.getParameter("pno"));
		
		ProductDAO dao=new ProductDAO();
		
		ProductDTO dto=dao.getProduct(pno);
		
		UserDTO udto=new UserDTO();
		
		request.setAttribute("dto", dto);
		request.setAttribute("udto", udto);
		
		// ProductReviewList
		HttpSession session = request.getSession();
		String id = (String)request.getAttribute("id");
		
		request.setAttribute("id", id);
		
		// 페이징
		// db 데이터 가져오기
		ReviewDAO rdao = new ReviewDAO();
		
		int pageSize = 2;

		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}

		int currentPage = Integer.parseInt(pageNum);
		
		int startRow = (currentPage-1)*pageSize+1; 
		
		int endRow = startRow + pageSize-1;
		
		ArrayList<ReviewDTO> reviewList = rdao.getReviewList(startRow, pageSize, pno);

		// 한 화면에 보여줄 '페이지 개수' 구하기
		int pageBlock = 5;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = (startPage+pageBlock)-1;
		
		int count = reviewList.size();
		
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}

		// request에 가져온 데이터 담기
		request.setAttribute("reviewList", reviewList);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);

		ActionForward forward=new ActionForward();
		forward.setPath("products/productContent.jsp");
		forward.setRedirect(false);
		return forward;
	}

}