package com.itwillbs.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.ReplyDAO;
import board.ReplyDTO;
import member.UserDAO;
import member.UserDTO;

public class BoardReplyDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		


		int rno=Integer.parseInt(request.getParameter("rno"));
		ReplyDAO rdao=new ReplyDAO();
		ReplyDTO rdto=rdao.getReply(rno);
		int bno = rdto.getBno();
		
		rdao.deleteReply(rno);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('댓글이 삭제되었습니다.');");
		out.println("location.href='BoardContent.bo?bno="+bno+"'");
		out.println("</script>");
		out.close();	
	
		return null;
	}

}
