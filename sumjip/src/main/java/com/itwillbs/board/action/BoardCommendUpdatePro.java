package com.itwillbs.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommendDAO;
import board.CommendDTO;

public class BoardCommendUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardCommendUpdatePro execute()");
		request.setCharacterEncoding("utf-8");

		int cno=Integer.parseInt(request.getParameter("cno"));
		int bno=Integer.parseInt(request.getParameter("bno"));
		String commend=request.getParameter("commend");

		CommendDTO dto=new CommendDTO();
		dto.setCno(cno);
		dto.setCommend(commend);
		
		ActionForward forward = null;
		if (commend=="") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('내용을 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();	
		} else {
		CommendDAO dao=new CommendDAO();
		dao.updateCommend(dto);

		forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno);
		forward.setRedirect(true);
		}
		return forward;
	
	}
	

}
