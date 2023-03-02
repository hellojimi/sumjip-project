package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class MemberPwModify implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		UserDAO dao=new UserDAO();
		UserDTO dto=dao.getUser(id);
		
		// request dto 저장
		request.setAttribute("dto", dto);
				
		// member/update.jsp 이동
		ActionForward forward=new ActionForward();
		forward.setPath("member/pwModify.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
