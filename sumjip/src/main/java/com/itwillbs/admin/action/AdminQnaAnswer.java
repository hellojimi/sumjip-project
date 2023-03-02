package com.itwillbs.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import qna.QnaDAO;
import qna.QnaDTO;

public class AdminQnaAnswer implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAnswer execute()");
		
		//request에 저장된 qno 파라미터값 가져오기
		int qno=Integer.parseInt(request.getParameter("qno"));
		
		//QnaDAO 객체생성
		QnaDAO qdao=new QnaDAO();
		QnaDTO qdto=qdao.getQna(qno);  
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('로그인 후에 보실 수 있습니다');");
			out.println("location.href='MemberLogin.me';");
			out.println("</script>");
			out.close();	
		}
		
		int no=qdto.getNo();
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUserNo(no);
		
		request.setAttribute("qdto", qdto);
		request.setAttribute("udto", udto);
		request.setAttribute("qno", qno);
		
		ActionForward forward = new ActionForward();
		forward.setPath("admin/answer.jsp");
		forward.setRedirect(false);		

		
		return forward;		
	
	}

}
