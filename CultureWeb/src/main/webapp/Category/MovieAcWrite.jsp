<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<jsp:include page="../inc/Top.jsp"></jsp:include>
<body>
<%
String id=(String)session.getAttribute("id");
//세션값이 없으면 login.jsp 이동
if(id==null){
	
	response.sendRedirect("../member/Login.jsp");
}
%>

<h2> 게시글 쓰기</h2>
<form action="MovieAcWritePro.jsp" method="post">
<input type="hidden" name="pass" value="1234">
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="20" cols="40"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn btn-outline-dark" >
<input type="button" value="글목록" class="btn btn-outline-dark" 
  onclick="location.href='notice.jsp'">
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>