package com.itwillbs.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;

public class AdminUserList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminUserList excute()");
		
		UserDAO dao=new UserDAO(); //한 페이지레 보여줄 글개수 설정
		int pageSize=10; //현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			//=>페이지번호가 없으면 1페이지 설정
			pageNum="1";
		}
		//pageNum => 숫자변경
		int currentPage=Integer.parseInt(pageNum);
		// 시작하는 행번호 구하기
		int startRow=(currentPage-1)*pageSize+1;
		//끝나는 행번호 구하기
		int endRow =startRow+pageSize-1;
		
		ArrayList<UserDTO> userList =dao.getUserList(startRow, pageSize);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		int pageBlock=10;
		//시작하는 페이지 번호 구하기
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		//끝나는 페이지 번호 구하기
		int endPage=startPage+pageBlock-1;

		int count = dao.getUserCount();

		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		//dto 정보 들고 가기(request 정보를 담아가기)
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("userList", userList);
		
		ActionForward forward=new ActionForward();
		forward.setPath("admin/userList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
