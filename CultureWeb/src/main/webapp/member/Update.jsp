<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form action="UpdatePro.jsp" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label> <br>
<input type="text" name="id" class="id" value="<%=id%>" readonly> <br>
<!-- <input type="button" value="dup. check" class="dup"><br> -->
<label>Password</label>
<input type="password" name="pass"><br>
<label>Name</label>
<input type="text" name="name" value="<%=memberDTO.getName()%>"><br>
<label>E-Mail</label>
<input type="email" name="email" value="<%=memberDTO.getEmail()%>"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label> 
<input type="text" name="address" value="<%=memberDTO.getAddress()%>"><br>
<label>Phone Number</label>
<input type="text" name="phone" value="<%=memberDTO.getPhone()%>"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value="<%=memberDTO.getMobile()%>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>

</body>
</html>