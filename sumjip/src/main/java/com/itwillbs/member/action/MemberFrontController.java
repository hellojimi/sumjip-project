package com.itwillbs.member.action;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()");
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
		
		if(sPath.equals("/Main.me")) {
			action = new Main();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		} else if(sPath.equals("/MemberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("member/login.jsp");
			forward.setRedirect(false);	
			
		} else if(sPath.equals("/MemberLoginPro.me")) {
			action = new MemberLoginPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(sPath.equals("/MemberMyList.me")) {
			action = new MemberMyList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(sPath.equals("/MemberReview.me")) {
			forward = new ActionForward();
			forward.setPath("member/review.jsp");
			forward.setRedirect(false);	
			
		} else if(sPath.equals("/MemberReviewPro.me")) {
			action = new MemberReviewPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	   } else if(sPath.equals("/MemberReviewModifyForm.me")) {
			action = new MemberReviewModifyForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	   } else if(sPath.equals("/MemberReviewModifyPro.me")) {
			action = new MemberReviewModifyPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
	   } else if(sPath.equals("/MemberReviewDelete.me")) {
			action = new MemberReviewDelete();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/MemberFindId.me")) {
			forward = new ActionForward();
			forward.setPath("member/findId.jsp");
			forward.setRedirect(false);	
			
	   } else if(sPath.equals("/MemberFindIdPro.me")) {
			action = new MemberFindIdPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/MemberFindPass.me")) {
			forward = new ActionForward();
			forward.setPath("member/findPass.jsp");
			forward.setRedirect(false);	
			
	   } else if(sPath.equals("/MemberFindPassPro.me")) {
			action = new MemberFindPassPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/MemberLogout.me")) {
			action = new MemberLogout();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/MemberMyPage_user.me")) {
			forward = new ActionForward();
			forward.setPath("member/myPage_user.jsp");
			forward.setRedirect(false);	
	  } else if(sPath.equals("/MemberPwModify.me")) {
			action = new MemberPwModify();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/MemberPwModifyPro.me")) {
			action = new MemberPwModifyPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   } else if(sPath.equals("/Result.me")) {
		   action = new Result();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   }else if(sPath.equals("/MemberAgree.me")) {
		   forward = new ActionForward();
		   forward.setPath("member/agree.jsp");
		   forward.setRedirect(false);   
	   }else if(sPath.equals("/MemberJoin.me")) {
		   forward = new ActionForward();
		   forward.setPath("member/join.jsp");
		   forward.setRedirect(false);   
	   }else if(sPath.equals("/MemberJoinPro.me")) {
		   action = new MemberJoinPro();
		   try {
		      forward=action.execute(request, response);
		   } catch (Exception e) {
		      e.printStackTrace();
		   }
		}else if(sPath.equals("/MemberUpdateForm.me")) {
			forward = new ActionForward();
			forward.setPath("member/updateForm.jsp");
		    forward.setRedirect(false);   
		}else if(sPath.equals("/MemberUpdatePro.me")) {
		    action = new MemberUpdatePro();
		    try {
		       forward=action.execute(request, response);
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		}else if(sPath.equals("/MemberDeleteForm.me")) {
			forward = new ActionForward();
			forward.setPath("member/deleteForm.jsp");
		    forward.setRedirect(false);   
		}else if(sPath.equals("/MemberDeletePro.me")) {
		    action = new MemberDeletePro();
		    try {
		       forward=action.execute(request, response);
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		}else if(sPath.equals("/MemberWishList.me")) {
			System.out.println("/MemberWishList.me");	
			 forward = new ActionForward();
				forward.setPath("member/Wish_List.jsp");
			    forward.setRedirect(false);
		 }else if(sPath.equals("/MemberWishListPro.me")) {
			    action = new MemberWishListPro();
			    try {
			       forward=action.execute(request, response);
			    } catch (Exception e) {
			       e.printStackTrace();
			    }
		}else if(sPath.equals("/Region1.me")) {
			action = new Region1();
		    try {
		       forward=action.execute(request, response);
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		}else if(sPath.equals("/Region2.me")) {
			action = new Region2();
		    try {
		       forward=action.execute(request, response);
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		}else if(sPath.equals("/Recommend.me")) {
			action = new Recommend();
		    try {
		       forward=action.execute(request, response);
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
		}
		
		// ----------------------------------------------
		// 주소 이동
		if(forward!=null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				// forward.isRedirect() == false
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response); // request값 들고감
			}
			
		}// if
		
	} // doProcess

} // MemberFrontController
