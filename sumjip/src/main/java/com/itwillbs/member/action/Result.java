package com.itwillbs.member.action;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.action.ActionForward;

import products.ProductDAO;
import products.ProductDTO;

public class Result implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Result execute()");
		
		
		request.setCharacterEncoding("utf-8");
		
		String indate=request.getParameter("indate");
		String outdate=request.getParameter("outdate");
		int guest=Integer.parseInt(request.getParameter("guest"));
		String region=request.getParameter("region");
		
		ProductDAO dao=new ProductDAO();
		LocalDate startDate = LocalDate.parse(indate);
		LocalDate endDate = LocalDate.parse(outdate);
		boolean result = endDate.isAfter(startDate);
		if(result==false) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('퇴실일이 입실일 이전이거나 입실일과 같습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		// 검색 기본날짜 설정
		String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		LocalDate NDate = LocalDate.parse(Date);
        NDate=NDate.plusDays(1);
        // 입실일이 과거면 안되게 하는 기능
        LocalDate nowDate = LocalDate.parse(Date);
        if(startDate.isBefore(nowDate)) {
        	response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('입실일이 과거입니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
        }
        
		//페이징
		int pageSize=9;// 한페이지에 몇개 펜션 보이게 할건지
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		
		
		
		
		
		
		
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock=10;
		// 시작하는 페이지 번호 구하기
		// currentPage			pageBlock	=> startPage
//				1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//				11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//				21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		// 끝나는 페이지 번호 구하기
		// startPage pageBlock => endPage
//			1			10	   =>	1+10-1  => 10
//			11			10	   =>	11+10-1 => 20
//			21			10	   =>	21+10-1 => 30
		int endPage=startPage+pageBlock-1;
		//전체글 개수 select count(*) from board
		// int 리턴할형 getBoardCount() 메서드 정의
		// getBoardCount() 메서드 호출
		int count = dao.getSearchProductCount(indate, outdate, guest, region);
		//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
		//전체페이지(pageCount) 구하기
		//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
		//
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		
		
		
		// request 담아서 이동
		ArrayList<ProductDTO> ProductList=dao.getSearchProductList(indate, outdate, guest, region, startRow, pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("ProductList", ProductList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("indate", indate);
		request.setAttribute("outdate", outdate);
		request.setAttribute("guest", guest);
		request.setAttribute("region", region);
		request.setAttribute("Date", Date);
		request.setAttribute("NDate", NDate);
		
		ActionForward forward=new ActionForward();
		forward.setPath("main/result.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
