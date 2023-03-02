package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class MemberLoginPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.userCheck(id, pass);
		
		ActionForward forward = null;
		if(dto!=null){
			//아이디 비밀번호 일치
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			forward = new ActionForward();
			forward.setPath("Main.me");
			forward.setRedirect(true);
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // html로 출력할 권한 받음
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 비밀번호를 잘못 입력하였습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			}
		
		return forward;	
	}
	

}
