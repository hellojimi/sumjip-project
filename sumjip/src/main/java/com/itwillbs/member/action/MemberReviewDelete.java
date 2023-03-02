package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.ReviewDAO;

public class MemberReviewDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberDelete execute()");
		
		// 후기 삭제 페이지
		// reviewDelete.jsp
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		ReviewDAO rdao = new ReviewDAO();
		rdao.deleteReview(ano);
		
		// 자바에서 HTML(JS) 동작하기
		//response.sendRedirect("myList.jsp");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('삭제되었습니다.')");
		out.println("location.href='MemberMyList.me'");
		out.println("</script>");
		out.close();
		
		return null;
	}
	
}
