package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class AdminBoardDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminBoardDeletePro execute()");
		
		int bno=Integer.parseInt(request.getParameter("bno"));

		BoardDAO dao=new BoardDAO();

		dao.deleteBoard(bno);

		ActionForward forward=new ActionForward();
		forward.setPath("AdminBoardList.ad");
		forward.setRedirect(true);
		return forward;
	}

}
