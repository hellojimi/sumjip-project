package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.action.ActionForward;

public interface Action {
	// 추상메서드 : 부모의 공통적인 메서드 틀
	// 리턴할형 이동정보를 담아서 리턴
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
