package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class BoardCommendForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCommenForm execute()");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getUser(id);
		int no = dto.getNo();
		int rno=Integer.parseInt(request.getParameter("rno"));
		int bno=Integer.parseInt(request.getParameter("bno"));
	
		request.setAttribute("no", no);
		request.setAttribute("rno", rno);
		request.setAttribute("bno", bno);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/CommendForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
