package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.ReviewDAO;
import member.ReviewDTO;
import member.UserDAO;
import member.UserDTO;

public class MemberReviewPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberReviewPro execute()");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String uploadPath = request.getRealPath("/upload");
		System.out.println(uploadPath);
		int maxSize = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int ano = Integer.parseInt(multi.getParameter("ano"));
		int pno = Integer.parseInt(multi.getParameter("pno"));
		
		String rtitle = multi.getParameter("title");
		String rstar = multi.getParameter("rating"); 
		String rcontent = multi.getParameter("content");
		int rcount = 0;
		Timestamp rdate = new Timestamp(System.currentTimeMillis());
		String rpic1 = multi.getFilesystemName("rpic1");
		String rpic2 = multi.getFilesystemName("rpic2");
		String rpic3 = multi.getFilesystemName("rpic3");
		
		// 로그인 후 id, no 값 가져오기
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		int no = udto.getNo();
		
		// dto 저장
		ReviewDTO dto = new ReviewDTO();
		dto.setNo(no);
		dto.setPno(pno);
		dto.setAno(ano);
	 	dto.setRtitle(rtitle);
	 	dto.setRstar(rstar);
	 	dto.setRcontent(rcontent);
	 	dto.setRdate(rdate);
	 	dto.setRpic1(rpic1);
	 	dto.setRpic2(rpic2);
	 	dto.setRpic3(rpic3);
	 
	 	// 리턴X insertReview()
	 	ReviewDAO dao = new ReviewDAO();
	 	dao.insertReview(dto);
	 	
	 	//response.sendRedirect("myList.jsp");
	 	ActionForward forward = new ActionForward();
	 	forward.setPath("MemberMyList.me");
	 	forward.setRedirect(true);
		
		return forward;
	}
	
}
