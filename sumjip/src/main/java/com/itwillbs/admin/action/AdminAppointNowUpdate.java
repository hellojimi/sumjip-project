package com.itwillbs.admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.admin.action.ActionForward;

import member.UserDAO;
import products.AppointmentDAO;
import products.AppointmentDTO;

public class AdminAppointNowUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int ano=Integer.parseInt(request.getParameter("ano"));
		int Astatus=Integer.parseInt(request.getParameter("Astatus"));
		UserDAO dao=new UserDAO();
		AppointmentDAO dao2=new AppointmentDAO();
		AppointmentDTO appointupdateDto=new AppointmentDTO();
		ActionForward forward=null;
		if(Astatus>=3){
			Astatus=3;
			 appointupdateDto.setAstatus(Astatus);
			 appointupdateDto.setAstatus(ano);
			 dao2.updateAppointment(appointupdateDto);	
				response.sendRedirect("AdminAppointNow.ad");
		}else{
			

		Astatus+=1;

		appointupdateDto.setAstatus(Astatus);
		appointupdateDto.setAno(ano);

		
		if(id.equals("admin")){
			// 리턴값없음 updateMember(MemberDTO updateDto) 메서드 정의 
			// dao.updateMember(updateDto) 메서드 호출
		dao2.updateAppointment(appointupdateDto);
			// => main.jsp 이동
		response.sendRedirect("AdminAppointNow.ad");

		}else{
		//  데이터 없으면 false => 아이디 비밀번호 틀림
		//=> script   "아이디 비밀번호 틀림" 뒤로이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('권한이 없는 사용자입니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			forward=null;
		    
		}
		
		
		}
	return forward;
	
	}
}
	
