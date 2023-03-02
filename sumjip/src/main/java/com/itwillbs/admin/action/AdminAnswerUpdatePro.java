package com.itwillbs.admin.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class AdminAnswerUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAnswerUpdatePro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		//request => qno, answer 파라미터 => 변수저장
		int qno=Integer.parseInt(request.getParameter("qno"));
		String answer=request.getParameter("answer");
		Timestamp qadate=new Timestamp(System.currentTimeMillis());
		
		// QnaDTO 객체생성
		QnaDTO dto=new QnaDTO();
		
		// set메서드 호출 qno,qcontent 저장
		dto.setQno(qno);
		dto.setAnswer(answer);
		dto.setQadate(qadate);
		
		//QnaDAO 객체생성 
		QnaDAO dao=new QnaDAO();
		// 메서드 호출
		dao.updateAnswer(dto); 
		
		// QnaList 이동
		ActionForward forward=new ActionForward();
		forward.setPath("AdminQnaList.ad");
		forward.setRedirect(true);
		
		return forward;
	}

}
