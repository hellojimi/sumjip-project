package com.itwillbs.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardDTO;

public class AdminBoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("AdminBoardList execute()");
        
        request.setCharacterEncoding("utf-8");
        
        String search=request.getParameter("search");
        
		BoardDAO dao=new BoardDAO();
		int pageSize=10; // 한페이지에 몇개 게시글 보이게 할건지
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";		
		}
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;

		ArrayList<BoardDTO> boardList=null;
		if(search==null) {
			//검색어 없음
			boardList=dao.getBoardList(startRow, pageSize);
		}else {
			//검색어 있음
			boardList=dao.getBoardList(startRow, pageSize, search);
		}	

		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		
		int count = 0;
		//검색어
		if(search==null){
			//검색어 없음
			count=dao.getBoardCount();
		}else {
			//검색어 있음
			count=dao.getBoardCount(search);	
			
		}		
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		// request 데이터 담기
		request.setAttribute("boardList", boardList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		request.setAttribute("search", search);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setPath("admin/boardList.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
