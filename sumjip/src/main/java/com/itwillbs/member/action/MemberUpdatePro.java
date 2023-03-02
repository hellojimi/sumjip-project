package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.UserDAO;
import member.UserDTO;

public class MemberUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request 한글처리
		request.setCharacterEncoding("utf-8");

		//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		int postnum=Integer.parseInt(request.getParameter("postnum"));
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String tel=request.getParameter("tel");

		//수정할 내용을 바구니 객체생성 => 바구니에 저장
		UserDTO updateDto=new UserDTO();
		updateDto.setId(id);
		updateDto.setPass(pass);
		updateDto.setUname(uname);
		updateDto.setEmail(email);
		updateDto.setPostnum(postnum);
		updateDto.setAddress1(address1);
		updateDto.setAddress2(address2);
		updateDto.setTel(tel);

		//UserDAO 객체생성 
		UserDAO dao=new UserDAO();

		//메서드 호출
		UserDTO dto=dao.userCheck(id,pass);
		ActionForward forward=null;
		if(dto!=null){
			// 아이디 비밀번호 일치 => 바구니 주소 가져오기
			// => dao.updateUser(updateDto) 메서드 호출
			// => ../main/main.jsp 이동	
			dao.updateUser(updateDto); 
			forward=new ActionForward();
			forward.setPath("MemberMyPage_user.me");
			forward.setRedirect(true);
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return forward;
	}

}
