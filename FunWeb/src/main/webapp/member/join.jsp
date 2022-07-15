<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 <script type="text/javascript">
 	
  var checkIdResult = true; // 아이디 중복확인 여부
  var checkPassResult = false; // 패스워드 검사
  var checkRetypePassReulst = false; // 패스워드 확인 결과
  
/*   //아이디 중복확인 여부
 function winopen(){
	  
	//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
	//1. 아이디가 없으면 알림창과 진행x
	var id = document.fr.id.value;
	if(id =="" || id.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.fr.id.focus();
		return
	}else{
		//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
		//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
		window.open("joinIdCheck.jsp?id="+id,"win","width=400, height=300");
	}
} */
   
  
	// 패스워드 보안강도 검사
	
 	function checkPass(pass){
		// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
		var spanElem = document.getElementById("checkPassResult");
		
		// 정규표현식 패턴 정의
		var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/; // 길이 및 사용 가능 문자 규칙
		var engUpperRegex = /[A-Z]/;	// 대문자
		var engLowerRegex = /[a-z]/;	// 소문자
		var numRegex = /[0-9]/;		// 숫자 규칙
		var specRegex = /[!@#$%]/;	// 특수문자 규칙
		
		var count = 0;	// 각 규칙별 검사 결과를 카운팅 할 변수
		
		if(lengthRegex.exec(pass)){	// 패스워드 길이 및 사용 가능 문자 규칙 통과 시
			spanElem.innerHTML = "사용 가능한 패스워드";
			spanElem.style.color = "GREEN";
			
			// 각 규칙별 검사 후 해당 항목이 포함되어 있을 경우 카운트 증가
			if(engUpperRegex.exec(pass)) count++;
			if(engLowerRegex.exec(pass)) count++;
			if(numRegex.exec(pass)) count++;
			if(specRegex.exec(pass)) count++;
			
			switch (count) {
			case 4:	//특수문자, 대문자, 소문자, 숫자 중 4개를 만족
				spanElem.innerHTML ="사용 가능한 패스워드(안전)";
				spanElem.style.color = "GREEN";
				checkPassResult = true;
				break;
			case 3: //특수문자, 대문자, 소문자, 숫자 중 3개를 만족
				spanElem.innerHTML ="사용 가능한 패스워드(보통)";
				spanElem.style.color = "YELLOW";
				checkPassResult = true;
				break;
			case 2: //특수문자, 대문자, 소문자, 숫자 중 2개를 만족
				spanElem.innerHTML ="사용 가능한 패스워드(위험)";
				spanElem.style.color = "ORANGE";
				checkPassResult = true;
				break;
			default: 
				spanElem.innerHTML ="영문자, 숫자, 특수문자 중 2가지 이상 조합 필수!";
				spanElem.style.color = "RED";
				checkPassResult = false;
			}
		} else {
			//spanElem.innerHTML = "사용 불가능한 패스워드";
			spanElem.innerHTML = "영문자, 숫자, 특수문자 조합 8 ~ 16자리 필수";
			spanElem.style.color = "RED";
			checkPassResult = false;
		}
		
	}
 	
 	// 패스워드 일치 여부 검사
 	function checkRetypePass(pass2) {
		
 		var pass = document.fr.pass.value;
		var spanElem = document.getElementById("checkRetypePassResult");
		if(pass == pass2){	// 패스워드 일치
			spanElem.innerHTML = "패스워드 일치";
			spanElem.style.color = "GREEN";
			checkRetypePassResult = true;
		} else {	// 패스워드 불일치
			spanElem.innerHTML = "패스워드 불일치";
			spanElem.style.color = "RED"
				checkRetypePassResult = false;
		}
		
	}
 	
	function checkSubmit(){
		
		if(!checkIdResult){
			alert("아이디 중복확인 필수!");
			document.fr.id.focus();
			return false;
		} else if(!checkPassResult){
			alert("올바른 패스워드 입력 필수!");
			document.fr.pass.focus();
			return false;
		} else if(!checkRetypePassResult){
			alert("패스워드 확인 필수!");
			document.fr.pass2.focus();
			return false;
		}
		
//		return true;
	}
 	
 </script>
 <script type="text/javascript" src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//class="dup" 클릭했을 때
		$('.dup').click(function(){
			//alert("클릭");
			//dupCheck2.jsp class="id" val()을 들고 가서 아이디 중복테크 하고
			// 그 결과를 가져와서 id="dupdiv" 내용 변경
			$.ajax({
				url:'dupCheck2.jsp',
				data:{'id':$('#id').val()},
				success:function(rdata){
					$('#dupdiv').html(rdata).css('color','blue');			
				}
			});
		});
	});
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post" onsubmit="return checkSubmit()">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup" ><br> <!-- onclick="winopen()" -->

<label><div id="dupdiv"></div></label><br><br>

<label>Password</label>
<input type="password" name="pass" onkeyup="checkPass(this.value)">
<span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시 영역 --></span><br>
<label>Retype Password</label>
<input type="password" name="pass2" onblur="checkRetypePass(this.value)">
<span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<!-- <label>Address</label>
<input type="text" name="address" id="postcode" readonly> <br> -->
<label>우편번호 </label>
<input type="text" name="zipcode" class="postcodify_postcode5" value="" />
<button type="button" id="postcodify_search_button">search</button><br />
<label>주소</label>
<input type="text" name="address" class="postcodify_address" value="" /><br />
<label>상세 주소</label>
<input type="text" name="address_detail" class="postcodify_details" value="" /><br />
<label>참고 항목</label>
<input type="text" name="address_etc" class="postcodify_extra_info" value="" /><br />
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</html>