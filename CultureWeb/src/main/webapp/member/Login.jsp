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
      max-width: 600px;
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
  <div class="container">
  
   <form action="LoginPro.jsp" id="join" method="post">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="mb-3">
              <label for="name">아이디</label>
              <input type="text" class="form-control" name="id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="mb-3">
              <label for="nickname">비밀번호</label>
              <input type="password" class="form-control" name="pass" placeholder="" value="" required>
              <div class="invalid-feedback">
                패스워드를 입력해주세요.
              </div>
            </div>
          </div> 
          <div class="bt_form">
          <input type="submit" value="Submit"  class="btn btn-outline-dark" style="margin-bottom: 3px;">
		  <input type="reset" value="Cancel"  class="btn btn-outline-dark" >
          </div>
          </form>
<!-- <form action="LoginPro.jsp" id="join" method="post">
<fieldset>
<legend>Login Info</legend>
<label>User ID</label>
<input type="text" name="id"><br>
<label>Password</label>
<input type="password" name="pass"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="btn btn-outline-dark">
<input type="reset" value="Cancel" class="btn btn-outline-dark">
</div>

</form>
 -->

</body>
</html>