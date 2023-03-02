<%@page import="member.ReviewDTO"%>
<%@page import="member.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 후기 삭제 페이지
	// reviewDelete.jsp
	int ano = Integer.parseInt(request.getParameter("ano"));
	
	ReviewDAO rdao = new ReviewDAO();
	rdao.deleteReview(ano);
	
	response.sendRedirect("MemberMyList.me");
%>