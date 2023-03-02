package com.itwillbs.admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.admin.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;

public class AdminAppointNow implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAppointNow execute()");
		
		AppointmentDAO dao=new AppointmentDAO();
			
			
		    int pageSize=10;
		// 현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
		// http://localhost:8080/webProject/Appointment/list.jsp
		// http://localhost:8080/webProject/Appointment/list.jsp?pageNum=2
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			//=> 페이지번호가 없으면 1페이지 설정
			pageNum="1";
		}
		// pageNum => 숫자변경
		int currentPage=Integer.parseInt(pageNum);
		// 시작하는 행번호 구하기
		// pageNum(currentPage)	   pageSize	=> startRow
//		 	1						10		=> 	(1-1)*10+1 => 0*10+1 =>  0+1 -> 1  ~10
//		 	2						10		=> 	(2-1)*10+1 => 1*10+1 => 10+1 -> 11 ~20
//		 	3						10		=> 	(3-1)*10+1 => 2*10+1 => 20+1 -> 21 ~30
		int startRow=(currentPage-1)*pageSize+1;
		// 끝나는 행번호 구하기
		// startRow	pageSize	=>	endRow
//				1		10		=>	1+10-1	=>	10
//		 		11		10		=>	11+10-1	=>	20
//				21		10		=>	21+10-1	=>	30
		int endRow = startRow+pageSize-1;
		ArrayList<AppointmentDTO> AppointmentList=dao.getAppointmentList2(startRow, pageSize);
		
		
				int pageBlock=10;
				// 시작하는 페이지 번호 구하기
				// currentPage			pageBlock	=> startPage
//						1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//						11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//						21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

				int startPage=(currentPage-1)/pageBlock*pageBlock+1;
				// 끝나는 페이지 번호 구하기
				// startPage pageBlock => endPage
//					1			10	   =>	1+10-1  => 10
//					11			10	   =>	11+10-1 => 20
//					21			10	   =>	21+10-1 => 30
				int endPage=startPage+pageBlock-1;
				//전체글 개수 select count(*) from Appointment
				// int 리턴할형 getAppointmentCount() 메서드 정의
				// getAppointmentCount() 메서드 호출
				int count = dao.getAdminAppointmentCount();
				//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
				//전체페이지(pageCount) 구하기
				//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
				//
				int pageCount=count/pageSize+(count%pageSize==0?0:1);
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				
				// dto request 담아서 이동
				request.setAttribute("AppointmentList", AppointmentList);
				request.setAttribute("startPage", startPage);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("endPage", endPage);
				request.setAttribute("pageCount", pageCount);
				
		ActionForward forward=new ActionForward();
		forward.setPath("admin/appointNow.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
