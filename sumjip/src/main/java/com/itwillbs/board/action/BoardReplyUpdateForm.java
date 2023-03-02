package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.ReplyDAO;
import board.ReplyDTO;
import member.UserDAO;
import member.UserDTO;

public class BoardReplyUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardReplyUpdateForm execute()");
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getUser(id);
		int no = dto.getNo();
		
		int rno=Integer.parseInt(request.getParameter("rno"));
		ReplyDAO rdao=new ReplyDAO();
		ReplyDTO rdto=rdao.getReply(rno);

		
		request.setAttribute("rno", rno);
		request.setAttribute("no", no);
		request.setAttribute("rdto", rdto);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/replyUpdateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
		}
	}

	
	

