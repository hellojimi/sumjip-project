package com.itwillbs.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class QuestionUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QuestionUpdateForm execute()");
		
		// qno 가져오기
		int qno=Integer.parseInt(request.getParameter("qno"));
		
		// QnaDAO 객체생성
		QnaDAO dao=new QnaDAO();
		
		// QnaDTO dto = getQna(qno) 메서드 호출
		QnaDTO dto = dao.getQna(qno);

		// request "dto", dto 담기
		request.setAttribute("dto", dto);
		
		// qna/question_updateForm.jsp 이동
		ActionForward forward=new ActionForward();
		forward.setPath("qna/question_updateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
