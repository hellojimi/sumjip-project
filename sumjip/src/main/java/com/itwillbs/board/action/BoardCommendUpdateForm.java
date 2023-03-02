package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.CommendDAO;
import board.CommendDTO;


public class BoardCommendUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCommendUpdateForm execute()");


		int cno=Integer.parseInt(request.getParameter("cno"));
		CommendDAO cdao=new CommendDAO();
		CommendDTO cdto=cdao.getCommend(cno);

		
		request.setAttribute("cdto", cdto);

		ActionForward forward = new ActionForward();
		forward.setPath("board/CommendUpdateForm.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
