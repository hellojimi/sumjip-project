package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class AdminAnswerUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAnswerUpdateForm execute()");
		
		// qno 가져오기
		int qno=Integer.parseInt(request.getParameter("qno"));
	
		QnaDAO dao=new QnaDAO();
		QnaDTO dto = dao.getQna(qno); 
		
		// request "dto", dto 담기
		request.setAttribute("dto", dto);	
		
		// qna/question_updateForm.jsp 이동
		ActionForward forward=new ActionForward();
		forward.setPath("admin/answer_updateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
