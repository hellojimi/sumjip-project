package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class MemberFindIdPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("uname");
		String email = request.getParameter("email"); 
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.findId(uname, email);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setPath("member/findIdPro.jsp");
		forward.setRedirect(false);
				
		return forward;
	}
	

}
