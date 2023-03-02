package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class MemberFindPassPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberFindPassPro execute()");
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");

		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getUser(id);
//		dto.setId(id);
			
		String email = dao.findEmail(id);
//		dto.setEmail(email);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setPath("member/findPassPro.jsp");
		forward.setRedirect(false);
		
		//임시 비밀번호 생성
		String tmpPasswd = dao.tmpPasswd(dto);
		//out.print(tmpPasswd);

		//임시 비밀번호 메일로 전송
		dao.sendTmpPw(tmpPasswd, dto);
		
		
						
		return forward;
	}

	

	}
