package com.itwillbs.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class QuestionUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QuestionUpdatePro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		//request => qno, qtitle, qcontent 파라미터 => 변수저장
		int qno=Integer.parseInt(request.getParameter("qno"));
		String qtitle=request.getParameter("qtitle");
		String qcontent=request.getParameter("qcontent");
		
		// QnaDTO 객체생성
		QnaDTO dto=new QnaDTO();
		
		// set메서드 호출 qno, qtitle, qcontent 저장
		dto.setQno(qno);
		dto.setQtitle(qtitle);
		dto.setQcontent(qcontent);
		
		//QnaDAO 객체생성
		QnaDAO dao=new QnaDAO();
		
		//updateQna(dto) 메서드 호출
		dao.updateQna(dto); 
		
		// QnaList 이동
		ActionForward forward=new ActionForward();
		forward.setPath("QnaList.qa");
		forward.setRedirect(true);
		
		return forward;
	}

}
