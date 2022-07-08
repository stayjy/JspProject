<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- 출처: https://7942yongdae.tistory.com/86 [프로그래머 YD:티스토리] -->
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
</head>
<body>
<jsp:include page="../inc/Top.jsp"></jsp:include>
  <div class="container">
  
   <form action="LoginPro.jsp" id="join" method="post">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">아이디</label>
              <input type="text" class="form-control" name="id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">비밀번호</label>
              <input type="password" class="form-control" name="pass" placeholder="" value="" required>
              <div class="invalid-feedback">
                패스워드를 입력해주세요.
              </div>
            </div>
          </div>
          <input type="submit" value="Submit" class="btn btn-outline-dark">
		  <input type="reset" value="Cancel" class="btn btn-outline-dark">
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