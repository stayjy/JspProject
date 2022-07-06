<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<article>
<h1>Join Us</h1>
<form action="JoinPro.jsp" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup"><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
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
</body>
</html>