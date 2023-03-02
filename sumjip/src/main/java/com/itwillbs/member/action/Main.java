package com.itwillbs.member.action;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import products.ProductDAO;
import products.ProductDTO;


public class Main implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ProductDAO dao=new ProductDAO();
		
        // 검색 기본날짜 설정
        String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
        LocalDate NDate = LocalDate.parse(Date);
        NDate=NDate.plusDays(1);
      //페이징
		int pageSize=9; // 한페이지에 몇개 펜션 보이게 할건지
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";		
		}
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int count = dao.getProductCount();
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		// request 담아서 이동
		ArrayList<ProductDTO> productlist = dao.getProductList(startRow, pageSize);
		request.setAttribute("productlist", productlist);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("Date", Date);
		request.setAttribute("NDate", NDate);
		
		ActionForward forward = new ActionForward();
		forward.setPath("main/main.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	private LocalDate plusDays(int i) {
		// TODO Auto-generated method stub
		return null;
	}

}
