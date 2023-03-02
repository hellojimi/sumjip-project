package com.itwillbs.admin.action;

import java.sql.Timestamp;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import board.BoardDAO;
import board.BoardDTO;


public class AdminBoardWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminBoardWritePro execute()");
		
		request.setCharacterEncoding("utf-8");
	
		// [유저번호, 제목, 내용, 조회수, 작성날짜] 변수에 저장
//		int no = Integer.parseInt(request.getParameter("no"));
		int no=1;
		String btitle= request.getParameter("btitle");
		String bcontent=request.getParameter("bcontent");
		int bcount=0;
		Timestamp bdate=new Timestamp(System.currentTimeMillis());

		BoardDTO dto=new BoardDTO();

		// 값 저장
		dto.setNo(no);
		dto.setBtitle(btitle);
		dto.setBcontent(bcontent);
		dto.setBcount(bcount);
		dto.setBdate(bdate);

		BoardDAO dao=new BoardDAO();

		dao.insertBoard(dto);
		
		// 글목록 이동
		ActionForward forward=new ActionForward();
		forward.setPath("AdminBoardList.ad");
		forward.setRedirect(true);
		return forward;
	}

}
