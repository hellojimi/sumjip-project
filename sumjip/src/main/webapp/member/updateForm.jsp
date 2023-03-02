<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
    
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<style>
#rap {
  width: 600px;
  margin: 30px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
/*   font-family: Arial, sans-serif; */
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
input[type="date"],
input[type="email"],
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
input[type="submit"],
input[type="reset"] {
  display: inline-block;
  padding: 10px;
  font-size: 1rem;
  color: #fff;
  background-color: #99b19c;
  border-radius: 5px;
  border: none;
  cursor: pointer;
}

  input[type="button"]:hover,  
  input[type="submit"]:hover,  
  input[type="reset"]:hover {  
    background-color: #113000;  
  }  */

label {
  display: block;
  font-size: 1rem;
  margin-bottom: 5px;
  font-weight: bold;
}

.clear {
  clear: both;
}

#error-msg {
  color: red;
  font-weight: bold;
  margin-top: 10px;
}

.divresult {
  margin-bottom: 10px;
  font-size: 1rem;
  font-weight: bold;
}

.address-wrap {
  display: flex;
  flex-wrap: wrap;
}

#sample4_postcode {
  width: 150px;
  margin-right: 10px;
}

#sample4_roadAddress {
  flex: 1;
  margin-right: 10px;
}

#sample4_detailAddress {
  flex: 1;
}
</style>
</head>
<body>
<%
//세션에서 "id" 값을 가져오기 => 변수저장
String id=(String)session.getAttribute("id");
//UserDAO 객체생성
UserDAO dao=new UserDAO();
//UserDTO dto =  getMember(id) 메서드 호출
UserDTO dto=dao.getUser(id);
%>
<!-- <section class="hero-section"> -->
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/my_header.jsp" />
<!-- 헤더들어가는 곳 -->

<div id="rap">
<!-- 본문들어가는 곳 -->

			<form action="MemberUpdatePro.me" id="join" method="post">
			<fieldset>
				<legend>개인정보 수정</legend>
				<label>아이디</label>
				<input type="text" name="id" class="id" value="<%=id%>" readonly><br>
				<label>비밀번호</label>
				<input type="password" name="pass" value="<%=dto.getPass()%>"><br>
				<label>이름</label>
				<input type="text" name="uname" value="<%=dto.getUname()%>"><br>
				<label>이메일</label>
				<input type="email" name="email" value="<%=dto.getEmail()%>"><br>
				<label>주소</label>
				<input type="text" id="sample4_postcode" name="postnum" value="<%=dto.getPostnum()%>" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address1" value="<%=dto.getAddress1()%>"><br>				
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address2" value="<%=dto.getAddress2()%>"><br>
				<label>전화번호</label>
				<input type="text" name="tel" value="<%=dto.getTel()%>"><br>
			</fieldset>
			<div id="buttons">
			<input type="submit" value="수정" class="submit">
			<input type="reset" value="취소" class="cancel">
			</div>
			</form>
		</div>

<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>

<!-- </div> -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>