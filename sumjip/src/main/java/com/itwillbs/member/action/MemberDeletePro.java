package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class MemberDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");

		//UserDAO 객체생성
		UserDAO dao=new UserDAO();
		//UserDTO = userCheck(id, pass) 메서드 호출
		UserDTO dto = dao.userCheck(id,pass);
		
		ActionForward forward=null;
		if(dto!=null){	
			// id,pass 일치
			dao.deleteUser(id); 
			// => 세션값 초기화
			HttpSession session = request.getSession();
			session.invalidate();
			forward=new ActionForward();
			forward.setPath("Main.me");
			forward.setRedirect(true);
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 비밀번호가 일치하지 않습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return forward;
	}

}
