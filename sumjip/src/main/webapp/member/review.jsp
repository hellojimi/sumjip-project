<%@page import="java.util.ArrayList"%>
<%@page import="member.ReviewDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
<head>
<meta charset="UTF-8">
<title>섬집</title>

<script type="text/javascript" src="script/jquery-3.6.3.js"></script>
<style>
	header {
		padding-bottom: 50px;
	}
	
	.reviewContainer h3 {
		font-family: 'NanumSquareNeoBold';
		margin: 10px;
	}
	
  	fieldset, article {
  		font-family: 'NanumSquareNeo';
 		max-width: 750px;
 		margin: 0 auto;
 		height: 100%;
 		padding: 20px;
 		box-sizing: border-box;
 	}
	
	.reviewContainer #reviewForm .reviewTitle {
		margin: 10px 0 10px 0 auto;
		padding-bottom: 20px;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
	}
	.reviewContainer #reviewForm .reviewTitleText {
		width: 500px;
		border-top: none;
		border-left: none;
		border-right: none;
	}
 	
 	.reviewContainer #reviewForm #reviewStars {
 		display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
 		margin: 10px 0px 10px 0px;
 		padding: 30px;
 	}
 	.reviewContainer #reviewForm .review_contents {
  		padding: 20px 0 0 0px;
 	}
 	.reviewContainer #reviewForm .review_contents textarea{
  		width: 100%;
		padding: 10px;
		box-sizing: border-box;
  		height: 250px;
  		resize: none;
 	}
 	.reviewContainer #reviewForm .review_contents .textCount {
 		text-align: right;
 	}
	
	.reviewContainer #reviewForm .pic {
		margin: 5px 0px 5px 0px;	
	}
	
  	.reviewContainer #reviewForm #Buttons {
		text-align: right;
 		padding: 20px 0px 20px 0px;
 	}
 	
 	.reviewContainer #reviewForm .btn {
 		display: inline-block;
 		width: 150px;
 		height: 50px;
 	}
 	.star_rating .rate_radio {
		position: relative;
		display: inline-block;
		z-index: 20;
		opacity: 0.001;
		width: 60px;
		height: 60px;
		background-color: #fff;
		cursor: pointer;
		vertical-align: top;
		display: none;
	}
	
	.star_rating .rate_radio + label {
		position: relative;
		display: inline-block;
		margin-left: -4px;
		z-index: 10;
		width: 60px;
		height: 60px;
		background-image: url('img/starrate.png');
		background-repeat: no-repeat;
		background-size: 60px 60px;
		cursor: pointer;
		background-color: #f0f0f0;
	}
	
	.star_rating .rate_radio:checked + label {
		background-color: #FCC419;
	}
	
	footer {
		padding-top: 50px;
	}
	
</style>
</head>

<body>
<!-- 리뷰 작성 페이지 -->
<%
 	String id = (String)session.getAttribute("id");
	
	// 아이디 없으면 로그인 페이지로 이동
	if(id == null) {
		%>
		<script type="text/javascript">
   			alert("로그인을 해주세요");
 		</script>
		<%
		response.sendRedirect("MemberLogin.me");
	}
	
	int ano = Integer.parseInt(request.getParameter("ano"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	
%>
	<!-- 헤더 들어가는 곳 -->
	<header>
		<jsp:include page="../inc/header.jsp" />
	</header>
 	
	<div class="reviewContainer">
		<article>
			<form name="reviewForm" action="MemberReviewPro.me" id="reviewForm" method ="post" onsubmit="return formCheck()" enctype="multipart/form-data">
				<input type="hidden" name="ano" value="<%=ano%>">
				<input type="hidden" name="pno" value="<%=pno%>">
				<div class="reviewTitle">
				한줄평 : <input type="text" name="title" class="reviewTitleText">
				</div>
				<!-- 별점 -->
				<div id="reviewStars">
					<h3>다녀오신 장소는 만족하셨나요?</h3>
					<div class="star_rating">
						<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
						<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
						<label for="rating1"></label>
						<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
						<label for="rating2"></label>
						<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
						<label for="rating3"></label>
						<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
						<label for="rating4"></label>
						<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
						<label for="rating5"></label>
					</div>
				</div>

				<!-- 	후기를 남겨주세요 -->
				<div class="review_contents">
					<h3>후기를 남겨주세요.</h3>
					<textarea name="content" id="review_textarea" maxlength="300"
							  placeholder="다녀오신 펜션의 후기를 남겨주세요! 사장님께 큰 도움이 됩니다."></textarea>
					<p class="textCount">(0 / 300)</p>
				</div>
					
				<div>
					<input type="file" name="rpic1" class="pic">
					<input type="file" name="rpic2" class="pic">
					<input type="file" name="rpic3" class="pic">
				</div>
				
				<div id="Buttons">
					<button type="reset" class="btn btn-dark">취소</button>
					<button type="submit" class="btn btn-success" id="submit">작성하기</button>
				</div>
				
			</form>
		</article>
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
	

</body>
<script type="text/javascript">
	// 별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
		// 별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		this.rate = newrate;	// 선택한 별점 값을 저장하는 변수
		let items = document.querySelectorAll('.rate_radio');
		items.forEach(function(item, idx) {
			if(idx < newrate) {
				item.checked = true;
			} else {
				item.checked = false;
			}
		});
	}
	
	let rating = new Rating();	// 별점 인스턴스 생성
	
	document.addEventListener('DOMContentLoaded', function(){
		// 별점선택 이벤트 리스너
		// 별 이미지를 클릭하면 setRate() 메서드 호출
		document.querySelector('.star_rating').addEventListener('click', function(e) {
			let elem = e.target;
			if(elem.classList.contains('rate_radio')) {
				rating.setRate(parseInt(elem.value));
			}
		});
	});
	
	// 후기 작성 글자수 초과 체크
	$(document).ready(function() {
		// 글자수 세기
		$('#review_textarea').on('keyup', function() {
			$('.textCount').html("("+$(this).val().length+" / 300)");
			
			// 글자수 제한
			if($(this).val().length > 300) {
				$(this).val($(this).val().substring(0, 300));
				$('.textCount').html("(300 / 300)");
			}
		});
	});

	function formCheck() {
		// submit 버튼을 누르면 onsubmit에 의해 formCheck() 함수 호출
		// title 비어있으면 메시지 표시
		if(document.querySelector('.reviewTitleText').value.length == 0) {
			alert("한줄평을 작성해주세요.");
			document.reviewForm.title.focus();
			return false;
		// 별점 선택 안했으면 메시지 표시, 체크된 값을 배열 형태로 받아서 length 확인
		} else if(document.querySelectorAll('input[name="rating"]:checked').length < 1) {
			alert("만족도를 선택해주세요.");
			return false;
		// 리뷰 5자 미만이면 메시지 표시
		} else if(document.querySelector('#review_textarea').value.length < 5) {
			alert("5자 이상으로 작성해 주세요.");
			document.reviewForm.content.focus();
			return false;
		}
		// 작성 여부 확인
		if(!confirm("작성하시겠습니까?")) {
			return false;	// 폼 전송 X
		} else 
			return true;	// 폼 전송
		
	}
</script>
</html>