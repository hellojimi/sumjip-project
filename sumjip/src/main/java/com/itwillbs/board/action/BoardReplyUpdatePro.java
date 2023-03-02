package com.itwillbs.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ReplyDAO;
import board.ReplyDTO;

public class BoardReplyUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardReplyUpdatePro execute()");
		request.setCharacterEncoding("utf-8");

		int rno=Integer.parseInt(request.getParameter("rno"));
		int bno=Integer.parseInt(request.getParameter("bno"));

		String riply=request.getParameter("riply");
		
		ReplyDTO dto=new ReplyDTO();

		dto.setRno(rno);
		dto.setRiply(riply);
		
		ActionForward forward = null;
		if (riply=="") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('내용을 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();	
		}else {
		
		ReplyDAO dao=new ReplyDAO();
		dao.updateReply(dto);

		forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno);
		forward.setRedirect(true);}
		
		return forward;
	}

}
