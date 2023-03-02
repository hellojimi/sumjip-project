package com.itwillbs.admin.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import qna.QnaDAO;
import qna.QnaDTO;

public class AdminAnswerWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAnswerWritePro execute()");
		
		
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		int qno=Integer.parseInt(request.getParameter("qno"));
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");	
		UserDAO udao=new UserDAO();
		UserDTO udto=udao.getUser(id);
		
		//request qtitle, qcount, qdate, answer 가져와서 변수에 저장
		String qtitle=request.getParameter("qtitle");
		int qcount=0;
		Timestamp qadate=new Timestamp(System.currentTimeMillis());
		String answer=request.getParameter("answer");	
		
		//QnaDTO 객체생성 
		QnaDTO dto=new QnaDTO();
			
		//set메서드 호출해서 값 저장
		dto.setQadate(qadate);
		dto.setAnswer(answer);
		dto.setQno(qno);
		
		//QnaDAO 객체생성
		QnaDAO dao=new QnaDAO();
		//메서드 호출
		dao.insertAnswer(dto);

		// 글목록 이동
		ActionForward forward=new ActionForward();
		forward.setPath("AdminQnaList.ad");
		forward.setRedirect(true);
		return forward;
	}

}
