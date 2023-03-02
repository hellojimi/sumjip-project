package com.itwillbs.admin.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.ReplyDAO;
import board.ReplyDTO;

public class AdminBoardReplyInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminBoardReplyInsert excute()");
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int no = Integer.parseInt(request.getParameter("no"));
		String riply = request.getParameter("riply");
		
		Timestamp rdate = new Timestamp(System.currentTimeMillis());

		ReplyDTO dto = new ReplyDTO();
		dto.setBno(bno);
		dto.setNo(no);
		dto.setRiply(riply);
		dto.setRdate(rdate);
		
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
		ReplyDAO dao = new ReplyDAO();
		dao.insertReply(dto);
		
		forward = new ActionForward();
		forward.setPath("AdminBoardContent.ad?bno="+bno);
		forward.setRedirect(true);
		}
		
		return forward;
	}

}
