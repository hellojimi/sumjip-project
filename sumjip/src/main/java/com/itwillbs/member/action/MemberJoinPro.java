package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.UserDAO;
import member.UserDTO;

public class MemberJoinPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String uname=request.getParameter("uname");
		String birth = request.getParameter("birth");
		//가입날짜
		Timestamp joindate=new Timestamp(System.currentTimeMillis());
		String email=request.getParameter("email");
		int postnum=Integer.parseInt(request.getParameter("postnum"));
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String tel=request.getParameter("tel");
		int utype=Integer.parseInt(request.getParameter("utype"));
		UserDTO dto = new UserDTO();
		 
		//=> 기억장소에 값을 저장
		dto.setId(id);
		dto.setPass(pass);
		dto.setUname(uname);
		dto.setBirth(birth);
		dto.setJoindate(joindate);
		dto.setEmail(email);
		dto.setPostnum(postnum);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setTel(tel);
		dto.setUtype(utype);

		//insertUser()매서드 정의해서 자바파일 객체생성하고 메서드 호출
		UserDAO dao = new UserDAO();
		dao.insertUser(dto);
		
		ActionForward forward = new ActionForward();
	 	forward.setPath("MemberLogin.me");
	 	forward.setRedirect(true);
		
		return forward;
	}

}
