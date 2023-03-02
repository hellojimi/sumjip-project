package com.itwillbs.qna.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import qna.QnaDAO;
import qna.QnaDTO;

public class QuestionWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("QnaWritePro execute()");
		
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		// User id 값 받아오기
		UserDAO udao=new UserDAO();
		UserDTO udto=udao.getUser(id);
		
		//request qtitle, qcount, qdate, qcontent 가져와서 변수에 저장
		String qtitle=request.getParameter("qtitle");
		int qcount=0;
		Timestamp qdate=new Timestamp(System.currentTimeMillis());
		String qcontent=request.getParameter("qcontent");
		
		ActionForward forward = null;
		if(qtitle==""||qcontent=="") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('제목 또는 내용을 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}else {
		//QnaDTO 객체생성 
		QnaDTO dto=new QnaDTO();
		
		//set메서드 호출해서 값 저장
		dto.setNo(udto.getNo());
		dto.setQtitle(qtitle);
		dto.setQstatus(0);
		dto.setQcount(qcount);
		dto.setQdate(qdate);
		dto.setQcontent(qcontent);
		
		//QnaDAO 객체생성
		QnaDAO dao=new QnaDAO();
		
		//insertQna(dto) 메서드 호출
		dao.insertQna(dto);
		
		// 글목록 이동
		forward=new ActionForward();
		forward.setPath("QnaList.qa");
		forward.setRedirect(true);}
		
		return forward;
	}

}
  