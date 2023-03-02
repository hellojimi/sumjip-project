<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<meta charset="UTF-8">
<title>섬집</title>

<link rel="stylesheet" href="css/insert.css" type="text/css" >
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
<script type="text/javascript">
 
$(document).ready(function(){
	$('#join').submit(function(){
	if($('.id').val()==""){
		alert("아이디를 입력하세요.");
		$('.id').focus();
		return false;
	}	
	if($('#idcheck').val()==""){
		alert("중복 확인을 해주세요.");
		$('.id').focus();
		return false;		
	}
	if($('#idcheck').val()=="n"){
		alert("아이디가 중복입니다. 다른 아이디로 다시시도 하세요.");
		$('.id').focus();
		return false;		
	}	
	if($('.pass').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass').focus();
		return false;
	}
	if($('.pass2').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass2').focus();
		return false;
	}
	if($('.pass').val() != $('.pass2').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('.pass2').focus();
		return false;
	}
	if ( ! (document.joinform.pass.value.length >= 8 && document.joinform.pass.value.length <= 16)) {
			alert("비밀번호 8 ~ 16자 사이로 입력해주세요");
			document.joinform.pass.focus();
			return false;
		}
	if($('.uname').val()==""){
		alert("이름을 입력하세요.");
		$('.uname').focus();
		return false;
	}
	if($('.birth').val()==""){
		alert("생년월일을 입력하세요.");
		$('.birth').focus();
		return false;
	}
	if($('.email').val()==""){
		alert("이메일을 입력하세요.");
		$('.email').focus();
		return false;
	}
	if($('.tel').val()==""){
		alert("전화번호를 입력하세요.");
		$('.tel').focus();
		return false;
	}
	if($('.postnum').val()==""){
		alert("우편번호를 입력하세요.");
		$('.postnum').focus();
		return false;
	}
	if($('.address1').val()==""){
		alert("주소를 입력하세요.");
		$('.address1').focus();
		return false;
	}
	if($('.address2').val()==""){
		alert("상세주소를 입력하세요.");
		$('.address2').focus();
		return false;
	}
		}); //
	$('.dup').click(function(){
//		alert("클릭");
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return false;
		}
	$.ajax({
		url:'member/idCheck.jsp',
		data:{'id':$('.id').val()},
		success:function(result){
			if(result.trim()=="중복"){
				$('.divresult').html('이미 사용중인 아이디입니다.').css("color","red");	
				$('#idcheck').val('n');
			}else{
				$('.divresult').html('사용가능한 아이디입니다.').css("color","green");
				$('#idcheck').val('y');
			}			
		}
	});
	}); 
		
 }); //준비
 </script>
 
 <!-- 주소값 api -->
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
#wrap {
  width: 700px;
  margin: 30px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
  font-family: 'NanumSquareNeo';
}

legend {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 20px;
  float: center;
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
}

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
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<article>
<div id="wrap">
		
	
		<form action="MemberJoinPro.me" name="joinform" id="join" method="post">
			<fieldset>
				<legend>회원가입</legend>
				<div class="radio-wrap">		
				<input type="radio" name="utype" value="1" checked>일반회원	 
		  		<input type="radio" name="utype" value="2">사장님<br>
		  		</div>
		  		<div class="form-group">
				<label>아이디</label> 
				<input type="text" name="id" class="id" >
				<input type="button" value="중복확인" class="dup" >
				<input type="hidden" name="idcheck" value="" id="idcheck">
				<div class="divresult"> </div><br>
				<label>비밀번호</label> 
				<input type="password" name="pass" class="pass"><br> 
				<label>비밀번호 재확인</label> 
				<input type="password" name="pass2" class="pass2"><br> 
				<label>이름</label>
				<input type="text" name="uname" class="uname"><br> 
				<label>성별</label>
				<select name="gender">
					<option value="남">남</option>
					<option value="여">여</option>
					<option value="선택안함">선택안함</option>
				</select><br>
				<label>생년월일</label>
				<input type="date" name="birth" class="birth"><br>
				<label>이메일</label>
				<input type="email" name="email" class="email"><br>
				<label>전화번호</label> 
				<input type="text" name="tel" class="tel"><br>
				<label>주소</label>
				<div>
					<input type="text" id="sample4_postcode" name="postnum" style="width:530px; float:left;" class="postnum" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="float:right;"><br> 
				</div>
				<input type="text" id="sample4_roadAddress" class="address1" placeholder="도로명주소" name="address1">				
				<span id="guide" style="color:#999;display:none"></span><br>
				<input type="text" id="sample4_detailAddress" class="address2" placeholder="상세주소" name="address2">
				</div>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons" style="text-align:center;">
			
				<input type="submit" value="가입하기" class="submit" onclick="fun1()"> 
				<input type="reset" value="초기화하기" class="cancel">
				
			</div>
		</form>

</div>
	</article>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>