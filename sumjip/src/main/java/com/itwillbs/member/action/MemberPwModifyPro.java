package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.UserDAO;
import member.UserDTO;

public class MemberPwModifyPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberPwModifyPro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		// 수정할 내용을 바구니 객체생성 => 바구니에 저장
		UserDTO modifyPassDto=new UserDTO();

		modifyPassDto.setId(id);
		modifyPassDto.setPass(pass);
		// MemberDAO 객체생성
		UserDAO dao=new UserDAO();

		// MemberDTO dto=userCheck(id,pass) 메서드 호출
		UserDTO dto=dao.idCheck(id);
		
		ActionForward forward=null;
		if(dto!=null) {
			dao.modifyPass(modifyPassDto);
			
			forward=new ActionForward();
			forward.setPath("Main.me");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return forward;
	}
	

}
