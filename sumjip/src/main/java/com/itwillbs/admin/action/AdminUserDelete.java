package com.itwillbs.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class AdminUserDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminUserDelete execute()");
		
		String id=request.getParameter("id");

		UserDAO dao=new UserDAO();
		UserDTO dto=dao.idCheck(id);
		
		ActionForward forward=null;
		if(dto != null){
			// id,pass 일치
			// 리턴값없음 deleteMember(String id) 메서드 정의 
			// dao.deleteMember(id) 메서드 호출
			dao.delUserlist(id);
			// => 세션값 초기화
//			HttpSession session=request.getSession();
//			session.invalidate();		
			// => main.jsp 이동
			response.sendRedirect("AdminUserList.ad");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('유저목록에 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();		
		}
		return forward;
	}
	

}
