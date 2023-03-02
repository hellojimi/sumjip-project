package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class AdminBoardUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminBoardUpdateForm execute()");
		int bno=Integer.parseInt(request.getParameter("bno"));

		BoardDAO dao=new BoardDAO();

		BoardDTO dto=dao.getBoard(bno);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("admin/boardupdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
