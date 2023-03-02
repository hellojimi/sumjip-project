package com.itwillbs.board.action;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardFrontController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doProcess()");
		System.out.println("뽑은 가상주소 : " + request.getServletPath());
		String sPath=request.getServletPath();
		
		Action action = null;
		ActionForward forward=null;
		
		if(sPath.equals("/BoardWriteForm.bo")) {
			// board/writeForm.jsp 이동
			forward=new ActionForward();
			forward.setPath("board/boardWrite.jsp");
			forward.setRedirect(false);
		}else if(sPath.equals("/BoardList.bo")){
			action = new BoardList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardContent.bo")) {
			action = new BoardContent();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardReplyInsert.bo")) {
			action = new BoardReplyInsert();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}		
		}else if(sPath.equals("/BoardReplyUpdateForm.bo")) {
			action = new BoardReplyUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(sPath.equals("/BoardReplyUpdatePro.bo")) {
			action = new BoardReplyUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardReplyDeletePro.bo")) {
			action = new BoardReplyDeletePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardCommendForm.bo")) {
			action = new BoardCommendForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardCommentInsert.bo")) {
			action = new BoardCommentInsert();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardCommendUpdateForm.bo")) {
			action = new BoardCommendUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardCommendUpdatePro.bo")) {
			action = new BoardCommendUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BoardCommendDeletePro.bo")) {
			action = new BoardCommendDeletePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward!=null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response); // request값 들고감
			}
		}

		
	}
}
