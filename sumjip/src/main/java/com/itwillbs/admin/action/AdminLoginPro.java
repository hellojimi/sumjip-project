package com.itwillbs.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.admin.action.ActionForward;

import member.UserDAO;
import member.UserDTO;

public class AdminLoginPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.userCheck(id, pass);
		
		ActionForward forward = null;
		if(id.equals("admin") && dto !=null){
			//관리자 아이디 일치
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			forward = new ActionForward();
			forward.setPath("AdminMain.ad");
			forward.setRedirect(true);
		}else{

			forward = new ActionForward();
			forward.setPath("AdminMain.ad");
			forward.setRedirect(true);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // html로 출력할 권한 받음
			out.println("<script type='text/javascript'>");
			out.println("alert('권한이 없는 사용자입니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			}
		return forward;
		}
	

}
