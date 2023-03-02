package com.itwillbs.admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import board.BoardDAO;
import board.BoardDTO;
import board.ReplyDAO;
import board.ReplyDTO;
import member.UserDAO;
import member.UserDTO;

public class AdminBoardContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminBoardContent execute()");

		int bno=Integer.parseInt(request.getParameter("bno"));

		BoardDAO dao=new BoardDAO();
		
		BoardDTO dto=dao.getBoard(bno);
		
		// 조회수 증가
		dao.bCount(bno);
		
		HttpSession session = request.getSession();
		
		request.setAttribute("dto", dto);
		
		String id=(String)session.getAttribute("id");
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('로그인 후에 보실 수 있습니다');");
			out.println("location.href='AdminLogin.ad';");
			out.println("</script>");
			out.close();	
		}
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		int no = udto.getNo();

		ReplyDAO rdao = new ReplyDAO();

		int count = rdao.countReply(bno); // 댓글 개수 계산

		ArrayList<ReplyDTO> replylist = rdao.getReplyList(bno);

		request.setAttribute("dto", dto);
		request.setAttribute("replylist", replylist);
		request.setAttribute("count", count);
		request.setAttribute("no", no);
		request.setAttribute("bno", bno);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("admin/boardContent.jsp");
		forward.setRedirect(false);		

		
		return forward;
		
		
	}

}
