<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  /*   body {
      min-height: 100vh;

	 background: -webkit-gradient(linear, left bottom, right top);
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); 
    } */

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
</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");

//세션값 가져오기
String id=(String)session.getAttribute("id");

// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// MemberDTO memberDTO = getMember(id) 메서드 호출
MemberDTO memberDTO=memberDAO.getMember(id);
%>
	<div class="container">

		<form action="UpdatePro.jsp" id="join" method="post">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원 정보수정</h4>
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">아이디</label> <input type="text"
								class="form-control" name="id" value="<%=id%>" readonly>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" name="pass" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="email" value="<%=memberDTO.getEmail()%>" >
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
						<div class="mb-4"></div>
						<button class="btn btn-outline-secondary btn-lg btn-block"
							type="submit">수정 완료</button>
					</div>
				</form>
			</div>
	</div>
	</form>


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