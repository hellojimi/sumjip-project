package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.ReviewDAO;
import member.ReviewDTO;

public class MemberReviewModifyForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberReviewModifyForm execute()");
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO rdto = rdao.getReview(ano);
		
		request.setAttribute("rdto", rdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/member/reviewModify.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
