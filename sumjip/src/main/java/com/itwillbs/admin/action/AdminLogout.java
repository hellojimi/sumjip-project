package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogout implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminLogout execute()");
		// 세션 초기화
		HttpSession session=request.getSession();
		session.invalidate();
		
		// 이동 AdminMain.ad
		ActionForward forward=new ActionForward();
		forward.setPath("AdminLogin.ad");
		forward.setRedirect(true);
		return forward;
	}
	

}
