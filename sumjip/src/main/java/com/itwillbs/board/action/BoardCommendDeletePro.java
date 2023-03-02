package com.itwillbs.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommendDAO;
import board.CommendDTO;

public class BoardCommendDeletePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int cno=Integer.parseInt(request.getParameter("cno"));
		
		CommendDAO dao=new CommendDAO();
		CommendDTO dto = dao.getCommend(cno);
		int bno = dto.getBno();
		dao.deleteCommend(cno);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('답댓글이 삭제되었습니다.');");
		out.println("location.href='BoardContent.bo?bno="+bno+"'");
		out.println("</script>");
		out.close();	
		
		return null;
		
	}

}
