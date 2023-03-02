package com.itwillbs.board.action;



import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommendDAO;
import board.CommendDTO;

public class BoardCommentInsert implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentInsert execute()");
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int no = Integer.parseInt(request.getParameter("no"));
		String commend = request.getParameter("commend");
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		Timestamp cdate = new Timestamp(System.currentTimeMillis());

		CommendDTO dto = new CommendDTO();
		dto.setBno(bno);
		dto.setNo(no);
		dto.setRno(rno);
		dto.setCommend(commend);
		dto.setCdate(cdate);
		
		ActionForward forward = null;
		if (commend=="") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('내용을 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();	
		}else {
	
		CommendDAO dao = new CommendDAO();
		dao.insertCommend(dto);

		forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno);
		forward.setRedirect(true);
		}
		
		return forward;

	}

}
