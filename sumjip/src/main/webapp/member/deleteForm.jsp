<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<meta charset="UTF-8">
<title>섬집</title>  
</head>
<style>
#rap {
	height: 700px;
}
#delete {
  width: 600px;
  margin: 50px auto;
  margin-bottom: 200px;
  background-color: #fff;
  padding: 20px;
  padding-bottom: 60px; 
  border-radius: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}

legend {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
}

fieldset {
  border: none;
  margin: 0;
  padding: 0;
}

input[type="text"],
input[type="password"],
select {
  display: block;
  width: 100%;
  margin-bottom: 5px;
  padding: 10px;
  font-size: 1rem;
  border-radius: 5px;
  border: 1px solid #99b19c;
}

select option {
  font-size: 1rem;
}

input[type="button"],
input[type="submit"]{
  background-color: #99b19c;
  color: white;
  border: none;
  padding: 10px 20px;
  margin-right: 10px;
  font-size: 16px;
  cursor: pointer;
  border-radius: 5px;
  float: right;
}

  input[type="button"]:hover,  
  input[type="submit"]:hover{  
    background-color: #113000;  
  } 

label {
  display: block;
  font-size: 1rem;
  margin-bottom: 5px;
  font-weight: bold;
}
</style>
<body>
<jsp:include page="../inc/my_header.jsp" />
<div id="rap">
 <%
	String id=(String)session.getAttribute("id");
    UserDAO dao = new UserDAO();
    // MemberDTO dto = getMember(id) 메서드호출
    UserDTO dto = dao.getUser(id);
   %>

  <form action="MemberDeletePro.me" method="post" id="delete" name="deleteform">
	 <fieldset>	
	 	<legend>회원 탈퇴</legend>
			<label>아이디</label> : <input type="text" name="id" value="<%=id%>" readonly><br>
			<label>비밀번호</label> : <input type="password" name="pass"><br>
	</fieldset>
	<div id="buttons">
			<input type="submit" class="btn btn-outline-success" value="회원탈퇴">
	</div>
</form>
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html> 