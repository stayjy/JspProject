<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>


  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    input {   
  display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    
    }
  </style>
  <script type="text/javascript">
  
  var checkIdResult = true; // 아이디 중복확인 여부
  var checkPassResult = false; // 패스워드 검사
  var checkRetypePassReulst = false; // 패스워드 확인 결과
  
  
  
  
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
				spanElem.style.color = "GRAY";
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
		debugger;
		var pass = document.fr.pass.value;
		var spanElem = document.getElementById("checkRetypePassResult");
		if(pass == pass2){	// 패스워드 일치
			spanElem.innerHTML = "패스워드 일치";
			spanElem.style.color = "GREEN";
			checkRetypePassResult = true
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
</head>
<jsp:include page="../inc/Top.jsp"></jsp:include>

<body>
	<div class="container">

		<form action="JoinPro.jsp" id="join" method="post" name="fr" onsubmit="return checkSubmit()">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="mb-3">
							<label for="name">아이디</label> <input type="text"
								class="form-control" name="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" name="pass" onkeyup="checkPass(this.value)" required>
								<span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시 영역 --></span><br>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호 확인</label> <input type="password"
								class="form-control" name="pass2" onblur="checkRetypePass(this.value)" required>
								<span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시 영역 --></span><br>
							<div class="invalid-feedback">비밀번호를 재입력해주세요.</div>
						
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="email" placeholder="you@example.com"
							required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label>우편번호
							<button type="button" id="postcodify_search_button"
								style="padding: 4px 6px;" class="btn btn-outline-secondary">검색</button>
						</label> <input type="text" name="zipcode" class="postcodify_postcode5"
							value="" /> <label>주소</label> <input type="text" name="address"
							class="postcodify_address" value="" /> <label>상세 주소</label> <input
							type="text" name="address_detail" class="postcodify_details"
							value="" />

					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-outline-secondary btn-lg btn-block"
						type="submit">가입완료</button>
			</div>

		</form>
	</div>
	</div>
	</form>
	<!--  <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
    </footer>
  </div> -->

	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>


</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</html>